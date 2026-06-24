contract TestIfMalformed {
    receive() {
        if 2 + 2 == 4 { 
            dump("should not compile");
        }
    }
}
