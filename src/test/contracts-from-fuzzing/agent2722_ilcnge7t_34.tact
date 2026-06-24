struct Rec {
    i: Int;
    s: String;
    b: Bool;
}

contract DefaultStructInit {
    rec: Rec = Rec { i: 1, s: "hi", b: true };

    init() {
        self.rec = Rec { i: 100, s: "hello", b: false };
    }
}