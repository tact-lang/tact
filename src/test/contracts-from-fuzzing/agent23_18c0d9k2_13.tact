struct NestedOptional {
    val: Int?;
}

contract ManyOptionalFields {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: NestedOptional?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.o4 = null;
    }
}