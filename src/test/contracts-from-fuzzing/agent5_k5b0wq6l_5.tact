contract Test {
    receive() {
        dump(true); // Expect dump to print the Boolean value 'true'
    }
}
