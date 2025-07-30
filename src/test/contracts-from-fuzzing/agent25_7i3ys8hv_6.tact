contract TestDumpNull {
    receive() {
        dump(null); // dumps a null value; should be supported per documentation
    }
}
