struct MultiDefaulted {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

contract DefaultsStructFields {
    s: MultiDefaulted;

    init() {
        self.s = MultiDefaulted{};
    }
}