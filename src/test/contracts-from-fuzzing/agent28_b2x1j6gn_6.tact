contract TestIfElse {
    receive() {
        if (2 + 2 == 4) { 
            dump(42);
        } else { 
            dump(0);
        }
    }
}
