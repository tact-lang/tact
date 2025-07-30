message TestMsg {
    a: Int;
    b: Int?;
}

contract UseMsg {
    receive() {
        // Destructuring assignment from a message instance
        let TestMsg { a, b } = TestMsg{ a: 10, b: null };
        dump(a);
        // Dump b, note that b may be null
        dump(b);
    }
}
