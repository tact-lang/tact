contract TestBlock {
    receive() {
        // Block with explicit semicolon in the first block
        {
            let a: Int = 10;
            dump(a);
        }
        // Block without terminating semicolon in the second block
        {
            let b: Int = 20;
            dump(b)
        }
    }
}
