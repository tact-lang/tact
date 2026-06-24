fun testStrings(): String {
    return "Hello \n Tact";
}

contract TestFoo {
    receive() {
        testStrings();
    }
}
