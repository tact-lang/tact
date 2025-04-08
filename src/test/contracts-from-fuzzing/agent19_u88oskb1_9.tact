struct ContainsMapWithStruct {
    mapping: map<Int, StructInsideMap>;
}

struct StructInsideMap {
    foo: Int;
}

contract Test {
    data: ContainsMapWithStruct;

    init() {
        self.data = ContainsMapWithStruct{
            mapping: emptyMap()
        };
    }
}