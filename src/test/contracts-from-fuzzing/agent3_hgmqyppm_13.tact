contract TestDumpNullDirect {
    receive() {
        dump(null);
    }
}
