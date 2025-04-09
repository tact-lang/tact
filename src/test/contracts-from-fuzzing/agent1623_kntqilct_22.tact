struct BigNestedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
}

contract WithDefaults {
    data: BigNestedDefaults;
    init() {
        self.data = BigNestedDefaults{
            c: myAddress(),
            d: emptyCell(),
        };
    }
}