fun test_simple_string() {
    let s: String = "Hello world";
    dump(s);
}

contract TestContract {
    receive() {
        test_simple_string();
    }
}
