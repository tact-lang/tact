fun testUnicode(): String {
    return "smile \u{1F602} end";
}

contract TestContractUnicode {
    receive() {
        let s = testUnicode();
    }
}
