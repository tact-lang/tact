struct StructWithManyFields {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: String = "f";
    g: String = "g";
    h: Bool = true;
    i: Bool = false;
    j: Int = 10;
    k: Bool?;
    l: String?;
}

contract TestContract {
    bigStruct: StructWithManyFields = StructWithManyFields{};

    init() {
        self.bigStruct = StructWithManyFields{};
    }
}