struct PrimitiveDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: String = "hello";
    e: Cell;
    f: Slice;
}

contract DefaultsTest {
    data: PrimitiveDefaults;

    init() {
        self.data = PrimitiveDefaults{
            c: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}