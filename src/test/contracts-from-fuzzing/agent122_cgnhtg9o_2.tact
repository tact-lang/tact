contract MyContract {
    receive() {}
}

contract Test {
    receive() {
         let s = initOf MyContract();
    }
}
