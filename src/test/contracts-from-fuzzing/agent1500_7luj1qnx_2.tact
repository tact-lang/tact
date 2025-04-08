struct InnerNested {
    z: Int?;
}

struct Nested {
    y: InnerNested;
}

contract TestComplexPersistence {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "hello";
    val4: Address;
    val5: Cell; // removed default value, will init
    val6: Slice; // removed default value, will init
    val7: Nested;

    init() {
        self.val4 = myAddress();
        self.val5 = emptyCell();
        self.val6 = emptyCell().asSlice();
        self.val7 = Nested{ y: InnerNested{ z: null } };
    }
}