contract TestBlock {
    receive() {
        // A block with a single statement without semicolon
        { dump(10) }

        // A block with multiple statements with semicolons
        {
            let a: Int = 5;
            dump(a);
        }
    }
}
