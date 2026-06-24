// Contract with string and optional string and serialization hints
struct StringMix {
    a: String;
    b: String?;
}

contract PersistStringMix {
    s: StringMix;

    init() {
        self.s = StringMix{a: "aaa", b: null};
    }
}