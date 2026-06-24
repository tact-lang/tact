contract G {
    // No explicit init() declared, so implicit empty init exists
    receive() {}
}

contract TestG {
    receive() {
        // Using initOf on a contract with implicit init
        let s = initOf G();
    }
}
