struct Inline { a: Int; b: Bool }

contract OptionalInlineStruct {
    s: Inline?;
    init() {
        self.s = null;
    }
    receive() {}
}