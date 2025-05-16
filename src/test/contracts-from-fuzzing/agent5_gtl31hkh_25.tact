// Message with implicit default constructor
message M {
    a: Int;
}

contract Test {
    receive() {
        let m = M { a: 5 };
    }
}