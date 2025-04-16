struct StructA {
    value: Int;
}

struct StructB {
    sa: StructA;
}

struct StructC {
    sb: StructB;
}

contract MultiLevelNested {
    data: StructC;

    init() {
        self.data = StructC{
            sb: StructB{ sa: StructA{ value: 123 } }
        };
    }
}