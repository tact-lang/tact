contract TestBlock {
    receive() {
        { // Block with semicolon
            let a = 1;
            dump(a);
        }
        { // Block without semicolon on last statement
            let b = 2;
            dump(b)
        }
    }
}
