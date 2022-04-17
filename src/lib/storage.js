export function add() {
    localTableData.content.push(newRow);
    localStorage.setItem(selected, JSON.stringify(localTableData));
    change();
}