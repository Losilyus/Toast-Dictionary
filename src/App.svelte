<script>
  import { onMount } from "svelte";
  import Table from "./components/table/Table.svelte";
  import { writable, get } from "svelte/store";
  let year = new Date();

  onMount(() => {
    modalVisiblity = true;
  });

  let modalVisiblity = false,
    loginVisiblity = false;

  let config = {
    config: [
      {
        password: "123456",
      },
      {
        unitData: ["unitOne", "unitTwo"],
      },
    ],
  };

  let unitOne = {
    config: [
      {
        name: "Unit One",
      },
    ],
    content: [
      {
        ing: "car",
        tr: "araba",
        sentence: "my car is very fast.",
      },
      {
        ing: "apple",
        tr: "elma",
        sentence: "my apple is beautiful.",
      },
      {
        ing: "pee",
        tr: "çiş",
        sentence: "Merve wants to take my pee off my hand.",
      },
      {
        ing: "Mother",
        tr: "Anne",
        sentence: "Fahrettin loves Merve mother very very much.",
      },
      {
        ing: "Grandmother",
        tr: "Büyükanne",
        sentence: "Fahrettin loves Merve grandmother very very much.",
      },
      {
        ing: "Pencil",
        tr: "Kalem",
        sentence: "Fahrettin broke Merve pen.",
      },
      {
        ing: "Pencil case",
        tr: "Kalem kutu",
        sentence: "My pencil case more beautiful.",
      },
    ],
  };

  let unitTwo = {
    config: [
      {
        name: "Unit Two",
      },
    ],
    content: [
      {
        ing: "bear",
        tr: "ayı",
        sentence: "Bear is me horror.",
      },
    ],
  };

  localStorage.setItem("config", JSON.stringify(config));
  localStorage.setItem("unitOne", JSON.stringify(unitOne));
  localStorage.setItem("unitTwo", JSON.stringify(unitTwo));


  // localStorage.setItem("data", JSON.stringify(datas));

  let search = "search...";
  var localData = [];

  const data = writable();

  data.set(localStorage.getItem("unitOne"));
  var dataRes = get(data);

  const resData = JSON.parse(dataRes);
  localData = resData.content;

  $: visibleLocal = search
    ? localData
        .filter((local) => {
          let ing = local.ing.match(`${search}.*`);
          let tr = local.tr.match(`${search}.*`);
          local.lang = (ing ? "tr" : "") + (tr ? "eng" : "");
          return local.lang !== "";
        })
        .slice(0, 5)
    : localData.slice(0, 5);

  function exportData() {
    var fileBlob = new Blob([dataRes], { type: "application/octet-binary" });
    const a = document.createElement("a");
    const url = window.URL.createObjectURL(fileBlob);
    a.href = url;
    a.download = "export_data.json";
    a.click();
    a.remove();
  }

  async function login() {
    let userPass = resData.config[0].password;
    const { value: password } = await Swal.fire({
      title: "Enter your password",
      input: "password",
      inputLabel: "Password",
      inputPlaceholder: "Enter your password",
      inputAttributes: {
        maxlength: 10,
        autocapitalize: "off",
        autocorrect: "off",
      },
    });

    if (userPass == password) {
      console.log(userPass);
      Swal.fire(`Entered pasdsword: ${password}`);
      modalVisiblity = true;
    }
  }
</script>

{#if modalVisiblity}
  <Table />
{:else}
  <div class="abc">
    <div class="title">
      <br />
      <h1 style="cursor: pointer;" on:click={login}>Toast Dictionary</h1>
    </div>
    <section class="project-cont">
      <div class="inner">
        <div class="input-controls in-sec">
          <div
            class="input-word inp-control"
            contenteditable="true"
            bind:innerHTML={search}
          >
            search
          </div>
        </div>
        <div class="rules">
          <div class="tpsect in-sec">
            <ul class="wordlists">
              {#each visibleLocal as word}
                <li on:click={(event) => (search = event.target.innerText)}>
                  {visibleLocal[0]?.lang == "tr" ? word?.ing : word?.tr}
                </li>
              {/each}
            </ul>
          </div>
        </div>

        <div class="results-pane in-sec">
          <div class="result-text">
            {(visibleLocal[0]?.lang == "eng"
              ? visibleLocal[0]?.ing
              : visibleLocal[0]?.tr) || "\u200B Kelime arayın"}
          </div>
        </div>

        <div class="tpsect in-sec">
          <h2>{visibleLocal[0]?.sentence || "Kelime arayın"}</h2>
        </div>
      </div>
    </section>

    <footer>
      <link
        href="https://fonts.googleapis.com/css?family=Cookie"
        rel="stylesheet"
      /><a
        class="bmc-button"
        target="_blank"
        href="https://www.buymeacoffee.com/losilyus"
        ><img
          src="https://www.buymeacoffee.com/assets/img/BMC-btn-logo.svg"
          alt="Buy me a coffee"
        /><span style="margin-left:5px">Buy me a coffee</span></a
      >
      <span class="nt">Copyright © {year.getFullYear()} Losilyus</span>
    </footer>
  </div>
  <link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
    crossorigin="anonymous"
  />
  <link
    href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    rel="stylesheet"
    crossorigin="anonymous"
  />
{/if}

<style>
  .bmc-button img {
    width: 27px !important;
    margin-bottom: 1px !important;
    box-shadow: none !important;
    border: none !important;
    vertical-align: middle !important;
  }
  .bmc-button {
    line-height: 36px !important;
    height: 37px !important;
    text-decoration: none !important;
    display: inline-flex !important;
    color: #ffffff !important;
    background-color: #ff813f !important;
    border-radius: 3px !important;
    border: 1px solid transparent !important;
    padding: 1px 9px !important;
    font-size: 23px !important;
    letter-spacing: 0.6px !important;
    box-shadow: 0px 1px 2px rgba(190, 190, 190, 0.5) !important;
    -webkit-box-shadow: 0px 1px 2px 2px rgba(190, 190, 190, 0.5) !important;
    margin: 0 auto !important;
    font-family: "Cookie", cursive !important;
    -webkit-box-sizing: border-box !important;
    box-sizing: border-box !important;
    -o-transition: 0.3s all linear !important;
    -webkit-transition: 0.3s all linear !important;
    -moz-transition: 0.3s all linear !important;
    -ms-transition: 0.3s all linear !important;
    transition: 0.3s all linear !important;
  }
  .bmc-button:hover,
  .bmc-button:active,
  .bmc-button:focus {
    -webkit-box-shadow: 0px 1px 2px 2px rgba(190, 190, 190, 0.5) !important;
    text-decoration: none !important;
    box-shadow: 0px 1px 2px 2px rgba(190, 190, 190, 0.5) !important;
    opacity: 0.85 !important;
    color: #ffffff !important;
  }

  .abc {
    width: 100%;
    height: 100%;
    background-color: #2a9faf;
    font: 16px normal normal "Open Sans", Helvetica, sans-serif;
  }

  .title {
    text-align: center;
  }
  .title h1 {
    font: 80px normal normal "Bevan", sans-serif;
    color: #fff;
    text-shadow: 2px 2px 0px rgba(255, 255, 255, 0.5),
      4px 4px 0px rgba(255, 255, 255, 0.5);
    padding-bottom: 5px;
    border-bottom: 5px solid rgba(255, 255, 255, 0.5);
    width: 900px;
    margin: 20px auto;
    margin-top: 0px;
  }

  .project-cont {
    width: 900px;
    margin: 0px auto;
    background-color: rgba(255, 255, 255, 0.27);
    padding: 20px 0px;
    color: #fff;
  }

  .project-cont .inner {
    padding: 0px 20px;
  }

  /* Input Area */
  .input-controls {
    text-align: center;
  }
  .input-controls .inp-control {
    display: inline-block;
    padding: 5px 10px;
    font-size: 50px;
    vertical-align: middle;
    background-color: #167b88;
    border-radius: 10px;
  }

  .input-controls .input-word {
    max-width: 600px;
    min-width: 400px;
  }
  .input-controls .input-word:focus {
    outline: none;
  }

  .input-controls .button-submit {
    cursor: pointer;
    background-color: #167b88;
  }

  .input-controls .button-submit:active {
    background-color: #094e1a;
  }

  .rules {
    text-align: center;
  }

  .results-pane {
    font-size: 90px;
    text-align: center;
    font-family: Bevan;
    text-shadow: 1px 1px 0px #eee;
    margin: 30px auto;
    width: 800px;
    border-radius: 20px;
    color: #fff;
    border: 5px dashed #fff;
  }

  .tpsect {
    text-align: center;
    border-radius: 20px;
  }

  footer {
    font-size: 60px;
    color: #fff;
    text-align: center;
  }
  footer a {
    color: #fff;
  }

  footer .nt {
    display: block;
    font-size: 12px;
  }

  .wordlists {
    list-style-type: none;
  }

  .wordlists li {
    display: inline-block;
    padding: 4px 8px;
    margin: 5px 5px;
    align-items: center;
    background-color: #1990ad;
    border-radius: 5px;
    cursor: pointer;
    border: 1px solid #16547e;
  }

  .wordlists li:hover {
    background-color: #219ebd;
  }

  .wordlists li:active {
    -webkit-transform: scale(0.95);
  }

  .card-header h6 {
    padding: 10px 0;
  }

  .users-table th:first-child {
    width: 30px;
  }

  .users-table td {
    padding-top: 0.25rem;
    padding-bottom: 0.25rem;
  }

  .users-table img {
    max-height: 32px;
    width: auto;
    border: 1px solid #c7c7c7;
    margin-right: 10px;
  }
</style>
