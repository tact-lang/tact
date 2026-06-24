struct S { f: Int }

contract ArrangedOrder {
    first: S?;
    second: Int?;
    third: Bool?;

    init() {
        self.first = null;
        self.second = null;
        self.third = null;
    }
}