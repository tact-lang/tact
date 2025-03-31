contract MyContract {
    receive() {}
}

contract Test1 {
    receive() {
        let initPkg = initOf MyContract();
        let codeCell = codeOf MyContract;
    }
}
