fun testVerticalTab(): String {
    // testing that Tact accepts the valid escape \v
    return "Hello\vWorld";
}

contract Test {
    receive() {
        testVerticalTab();
    }
}
