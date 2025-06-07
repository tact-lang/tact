struct Combo {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
}

contract Test22 {
    c: Combo;

    init() {
        self.c = Combo{ i: 7, b: true, s: "hi", o: null };
    }
}