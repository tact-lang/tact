struct InnerStruct {
    x: Int;
    y: Int;
    label: String;
}

contract MultipleStructs {
    s1: InnerStruct;
    s2: InnerStruct;

    init() {
        self.s1 = InnerStruct{ x: 1, y: 2, label: "one" };
        self.s2 = InnerStruct{ x: 3, y: 4, label: "two" };
    }
}