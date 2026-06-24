fun compareStrings(): Bool {
    return "Hello" == "Hello";
}

contract Test {
    receive() {
        compareStrings();
    }
}
