struct Stringy {
    s: String = "This is a reasonably long default string to test serialization limits.";
}

contract Test9 {
    val: Stringy;

    init() {
        self.val = Stringy{};
    }

    receive() {}
}