fun test_empty_string() {
    let s: String = "";
    dump(s);
}

contract Test {
    receive() {
        test_empty_string();
    }
}
