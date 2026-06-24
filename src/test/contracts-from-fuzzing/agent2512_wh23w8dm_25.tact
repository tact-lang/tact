struct Sub1 { a: Int; }
struct Sub2 { s: Sub1; }

contract OptionalDeepStruct {
    ref: Sub2?;

    init() {
        self.ref = null;
    }
}