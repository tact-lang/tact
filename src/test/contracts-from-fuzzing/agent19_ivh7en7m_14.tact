struct Pair {
    a: Int;
    b: String;
}

contract Test {
    receive() {
        let p = Pair { a: 1, b: "one" };
    }
}