contract TestBlockNoSemicolon {
    receive() {
        // A block with multiple statements, with the final semicolon omitted
        {
            let a: Int = 10;
            dump(a)  // no semicolon here
        }
    }
}
