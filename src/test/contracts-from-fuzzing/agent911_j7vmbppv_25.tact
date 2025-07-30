struct Layer1 {
    f1: Int;
    f2: Bool?;
}

struct Layer2 {
    nested: Layer1?;
}

contract NestedOptionalStructs {
    data: Layer2;

    init() {
        self.data = Layer2{
            nested: null
        };
    }
}