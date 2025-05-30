struct StructOne {
    num: Int;
    flag: Bool;
}

struct StructTwo {
    text: String;
    optNum: Int?;
}

contract TestContract {
    field1: StructOne;
    field2: StructTwo;

    init() {
        self.field1 = StructOne{num: 1, flag: true};
        self.field2 = StructTwo{text: "hello", optNum: null};
    }
}