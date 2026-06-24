contract Valid {
    receive() {}
}

contract Test1 {
    receive() {
        let a = initOf Valid();
        let b = codeOf Valid;
    }
}
