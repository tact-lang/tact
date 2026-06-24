contract Test {
    receive() {
        { 
            let a: Int = 2 + 2;
            dump(a)
        }
    }
}