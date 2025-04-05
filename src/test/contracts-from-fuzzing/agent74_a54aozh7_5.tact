contract TestBlock {
    receive() {
        // Block with a single statement and omitting semicolon in the last statement
        {
            dump(7)
        }
        
        // Block with multiple statements, proper semicolons
        {
            let x: Int = 3;
            dump(x);
        }
    }
}
