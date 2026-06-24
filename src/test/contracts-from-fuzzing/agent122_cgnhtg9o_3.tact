contract MyContract {
    receive() {}
}

contract Test {
    receive() {
         let code_cell = codeOf MyContract;
    }
}
