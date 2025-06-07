contract TestBlockSemicolon {
    receive() {
        {
            let x: Int = 42;
            dump(x) // omitting semicolon on last statement is allowed
        }
    }
}
