contract Test {
    receive() {
        // Block statement with optional semicolon omission
        {
            let x: Int = 7;
            dump(x) // no semicolon at the end, valid block
        }
    }
}
