struct StringStuff { a: String; b: String? }

contract StringNest {
    s: StringStuff;

    init() {
        self.s = StringStuff{ a: "abc", b: null };
    }

    receive() {
        self.s = StringStuff{ a: self.s.a, b: self.s.b };
    }
}