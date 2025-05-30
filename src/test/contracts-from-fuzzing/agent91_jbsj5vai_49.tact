struct SSub {
    s: String;
    b: Bool;
}

contract StructWithStringInside {
    x: SSub;

    init() {
        self.x = SSub{ s: "hello", b: true };
    }
}
