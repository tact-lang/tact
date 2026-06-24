struct Booly {
    count: Int;
    flag: Bool?;
    label: String = "label";
}

contract NestedComplex {
    inner: Booly;

    init() {
        self.inner = Booly{ count: 10 };
    }
}
