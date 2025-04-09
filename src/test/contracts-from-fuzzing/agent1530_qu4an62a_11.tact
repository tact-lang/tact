struct Ints {
    i1: Int;
    i2: Int;
    i3: Int;
}

contract StructFieldContract {
    field1: Int;
    field2: Ints;

    init() {
        self.field1 = 7;
        self.field2 = Ints{i1: 1, i2: 2, i3: 3};
    }
}