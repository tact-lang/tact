struct NestedStruct {
    number: Int;
    flag: Bool?;
}

struct OuterStruct {
    nested: NestedStruct;
    text: String;
}

contract TestStorage {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: NestedStruct{ number: 5, flag: true },
            text: "Hello"
        };
    }
}