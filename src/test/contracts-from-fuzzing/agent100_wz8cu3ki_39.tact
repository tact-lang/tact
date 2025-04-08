struct Wrap {
    s: String;
    o: String?;
}

contract Test40 {
    w: Wrap;

    init() {
        self.w = Wrap{ s: "test", o: null };
    }
}