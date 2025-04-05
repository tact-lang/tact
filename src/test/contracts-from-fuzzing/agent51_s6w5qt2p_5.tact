contract Test {
    receive() {
        { // Block statement test
            let a: Int = 5;
            dump(a)
        }
    }
}
