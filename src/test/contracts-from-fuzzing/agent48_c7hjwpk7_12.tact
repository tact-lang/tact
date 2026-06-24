contract Test {
    receive() {
        // try without a catch block
        try {
            throw(111);
        }
        dump(222);
    }
}
