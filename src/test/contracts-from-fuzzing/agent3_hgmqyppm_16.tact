contract TestDumpConditional {
    receive() {
        if (2 + 2 == 4) {
            dump("Yes");
        } else {
            dump("No");
        }
    }
}
