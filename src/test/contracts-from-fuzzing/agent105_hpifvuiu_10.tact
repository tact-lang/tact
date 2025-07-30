fun compare_strings() {
    let s: String = "Hello";
    if (s == "Hello") {
        dump(1);
    } else {
        dump(0);
    }
}

contract Test {
    receive() {
        compare_strings();
    }
}
