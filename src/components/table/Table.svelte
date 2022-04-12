<script>
    import { onMount } from "svelte";

    onMount(()=>{
        console.log("onMount");
    });
</script>    


    <div class="container pt-8 mx-auto" x-data="loadEmployees()">
      <input
        x-ref="searchField"
        x-model="search"
        placeholder="Search for an employee..."
        type="search"
        class="block w-full bg-gray-200 focus:outline-none focus:bg-white focus:shadow text-gray-700 font-bold rounded-lg px-4 py-3"
      />
      <div class="mt-4 grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        <template x-for="item in filteredEmployees" :key="item">
          <div
            class="flex items-center shadow hover:bg-indigo-100 hover:shadow-lg hover:rounded transition duration-150 ease-in-out transform hover:scale-105 p-3"
          >
            <img
              class="w-10 h-10 rounded-full mr-4"
              src=""
            />
            <div class="text-sm">
              <p
                class="text-gray-900 leading-none"
              >sdfsa</p>
              <p
                class="text-gray-600"
              >dfasf</p>
            </div>
          </div>
        </template>
      </div>
    </div>
    