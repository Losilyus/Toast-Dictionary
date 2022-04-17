<script>
  import { onMount } from "svelte";
  import { writable, get } from "svelte/store";
  import { unitSelect } from "../../lib/store";


  let unit = JSON.parse(localStorage.getItem("config")).unitData;

  let localDataName = ["config", ...unit],
  localStorageData ={};

  localDataName.forEach((item) => 
    localStorageData[item] = JSON.parse(localStorage.getItem(item))
  );
  localStorageData = JSON.stringify(localStorageData);
 

  let selected = unit[0],
      newRow = {},
      localTableData = [],
      config,
      files;

  let unitAddInput

  function change() {
    config = JSON.parse(localStorage.getItem("config"));
    unitSelect.set(selected)
    localTableData = JSON.parse(localStorage.getItem(selected));
  }

  function add() {
    localTableData.content.push(newRow);
    localStorage.setItem(selected, JSON.stringify(localTableData));
    change();
  }

  function addUnit() {
    let unitDataPusher = {
      config: [
        {
          name: `${unitAddInput}`,
        },
      ],
      content: [
        {
          ing: "toast",
          tr: "tost",
          sentence: "I Love Toast.",
        },
        
      ],
    };
    config.unitData.push(unitAddInput);
    localStorage.setItem("config", JSON.stringify(config));
    localStorage.setItem(unitAddInput, JSON.stringify(unitDataPusher));
    change();
  }


  function deleteRow(selectedRow) {
    localTableData.content = localTableData.content.filter((row) => row !== selectedRow);
    localStorage.setItem(selected, JSON.stringify(localTableData));
    change();
  }

  const importData = e =>{
    const reader = new FileReader();
    reader.addEventListener('load', function () {
      files = JSON.parse(this.result);
    });
    reader.readAsText(e.target.files[0]);
    let objKeys = Object.keys(files);
    objKeys.forEach((item) => {
      localStorage.setItem(item, JSON.stringify(files[item]));
    });
    change();
  }


  function exportData() {
    var fileBlob = new Blob([localStorageData], { type: "application/octet-binary" });
    const a = document.createElement("a");
    const url = window.URL.createObjectURL(fileBlob);
    a.href = url;
    a.download = "export_data.json";
    a.click();
    a.remove();
  }

  change();
  
</script>

<div class="flex h-screen bg-gray-50 dark:bg-gray-900">
  <div class="flex flex-col flex-1 w-full">
    <main class="h-full pb-16 overflow-y-auto">
      <div class="container grid px-6 mx-auto">
        <h2
          class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
        >
        Panel
        </h2>

        <div
          class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
        >
          <div class="flex">
            <div class="flex-wrap w-full">
              <!-- svelte-ignore a11y-label-has-associated-control -->
              <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">Search</span>
                <div
                  class="relative text-gray-500 focus-within:text-purple-600 dark:focus-within:text-purple-400"
                >
                <div class="relative text-gray-500 focus-within:text-purple-600">
                  <input bind:value={unitAddInput} class="block w-full pr-20 mt-1 text-sm text-black dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray form-input" placeholder="Add Unit">
                  <button on:click={addUnit} class="absolute inset-y-0 right-0 px-4 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-r-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                    Add
                  </button>
                </div> 
                </div>
              </label>
            </div>
            <div class=" w-full ml-2">
              <label class="text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Select unit
                </span>
                <select
                  on:click={change}
                  bind:value={selected}
                  class="w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                >
                  {#each config.unitData as option}
                    <option value={option}>{option}</option>
                  {/each}
                </select>
              </label>
            </div>
          </div>
        </div>

        <div class="w-full overflow-hidden rounded-lg shadow-xs">
          <div class="w-full">
            <table class="w-full h-34 whitespace-no-wrap">
              <thead>
                <tr
                  class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                >
                    <th class="px-4 py-3">Engilish</th>
                    <th class="px-4 py-3">Turkish</th>
                    <th class="px-4 py-3">Sentence</th>
                    <th class="px-4 py-3">Tag</th>
                    <th class="px-4 py-3">Actions</th>
                  
                </tr>
              </thead>
              <tbody
                class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
              >
                <tr class="text-gray-700 dark:text-gray-400">
                  <td class="px-4 py-3">
                    <div class="flex items-center text-sm">
                      <div>
                        <p class="text-xl text-gray-600 dark:text-gray-400">
                          <input
                            class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                            placeholder="Eng word"
                            bind:value={newRow.ing}
                          />
                        </p>
                      </div>
                    </div>
                  </td>
                  <td class="px-4 py-3 text-gray-600 text-lg">
                    <input
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      placeholder="Tr word"
                      bind:value={newRow.tr}
                    />
                  </td>
                  <td class="px-4 py-3 text-gray-600 text-l">
                    <input
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      placeholder="Sentence"
                      bind:value={newRow.sentence}
                    />
                  </td>
                  <td class="px-4 py-3 text-sm">
                    <span
                      class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                    >
                      {localTableData.config[0].name}
                    </span>
                  </td>
                  <td class="px-4 py-3">
                    <div class="flex items-center space-x-4 text-sm">
                      <button
                        class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                        aria-label="Edit"
                        on:click={add}
                      >
                        <svg
                          class="w-5 h-5"
                          aria-hidden="true"
                          fill="currentColor"
                          stroke="none"
                          viewBox="0 0 20 20"
                        >
                          <path
                            fill-rule="evenodd"
                            d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                            clip-rule="evenodd"
                          />
                        </svg>
                      </button>
                    </div>
                  </td>
                </tr>
                {#each localTableData.content as word}
                  <tr class="text-gray-700 dark:text-gray-400">
                    <td class="px-4 py-3">
                      <div class="flex items-center text-sm">
                        <div>
                          <p class="text-xl text-gray-600 dark:text-gray-400">
                            {word.ing}
                          </p>
                        </div>
                      </div>
                    </td>
                    <td class="px-4 py-3 text-gray-600 text-lg">
                      {word.tr}
                    </td>
                    <td class="px-4 py-3 text-gray-600 text-l">
                      {word.sentence}
                    </td>
                    <td class="px-4 py-3 text-sm">
                      <span
                        class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                      >
                        {localTableData.config[0].name}
                      </span>
                    </td>
                    <td class="px-4 py-3">
                      <div class="flex items-center space-x-4 text-sm">
                        <!--
                          <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray" aria-label="Edit">
                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                              <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"></path>
                              <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                            </svg>
                          </button>
                        -->
                        <button
                          class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                          aria-label="Delete"
                          on:click={() => deleteRow(word)}
                        >
                          <svg
                            class="w-5 h-5"
                            aria-hidden="true"
                            fill="currentColor"
                            viewBox="0 0 20 20"
                          >
                            <path
                              fill-rule="evenodd"
                              d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                              clip-rule="evenodd"
                            />
                          </svg>
                        </button>
                      </div>
                    </td>
                  </tr>
                {/each}
              </tbody>
            </table>
          </div>
         <!--
          <div
            class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
          >
            <span class="flex items-center col-span-3">
              Showing 21-30 of 100
            </span>
            <span class="col-span-2" />
            <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
              <nav aria-label="Table navigation">
                <ul class="inline-flex items-center">
                  <li>
                    <button
                      class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                      aria-label="Previous"
                    >
                      <svg
                        class="w-4 h-4 fill-current"
                        aria-hidden="true"
                        viewBox="0 0 20 20"
                      >
                        <path
                          d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                          clip-rule="evenodd"
                          fill-rule="evenodd"
                        />
                      </svg>
                    </button>
                  </li>
                  <li>
                    <button
                      class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                    >
                      1
                    </button>
                  </li>
                  <li>
                    <button
                      class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                    >
                      2
                    </button>
                  </li>
                  <li>
                    <button
                      class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple"
                    >
                      3
                    </button>
                  </li>
                  <li>
                    <button
                      class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                    >
                      4
                    </button>
                  </li>
                  <li>
                    <span class="px-3 py-1">...</span>
                  </li>
                  <li>
                    <button
                      class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                    >
                      8
                    </button>
                  </li>
                  <li>
                    <button
                      class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                    >
                      9
                    </button>
                  </li>
                  <li>
                    <button
                      class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
                      aria-label="Next"
                    >
                      <svg
                        class="w-4 h-4 fill-current"
                        aria-hidden="true"
                        viewBox="0 0 20 20"
                      >
                        <path
                          d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                          clip-rule="evenodd"
                          fill-rule="evenodd"
                        />
                      </svg>
                    </button>
                  </li>
                </ul>
              </nav>
            </span>
          </div>
         --> 
        </div>

        <div
          class="px-4 mt-6 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
        >
          <div class="flex">
            <div class="file flex-wrap w-full">
              Import Data
              <input type="file" class="hide_file" on:change={importData} name="import">
            </div>

            <div class=" w-full ml-2">
              <button on:click={exportData} class="w-full py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                Export Data
              </button>
            </div>
          </div>
        </div>

      </div>
    </main>
  </div>
</div>

<style>
  .file{
  padding:10px; 
  background:#7E3AF2;
  border:1px solid #7E3AF2;
  position:relative;
  color:#fff;
  border-radius:5px;
  text-align:center;
  float:left;
  cursor:pointer
}
.hide_file {
    position: absolute;
    z-index: 1000;
    opacity: 0;
    cursor: pointer;
    right: 0;
    top: 0;
    height: 100%;
    font-size: 4px;
    width: 100%;
    
}
</style>