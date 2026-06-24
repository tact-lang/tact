struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "def";
    d: Address;
    e: Cell;
}

contract TestContract {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{
            d: myAddress(),
            e: emptyCell(),
        };
    }
}
