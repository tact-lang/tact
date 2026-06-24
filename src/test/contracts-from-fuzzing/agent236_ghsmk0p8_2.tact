struct Layer1 {
    nested: Layer2;
}

struct Layer2 {
    optionalInt: Int?;
    optionalBool: Bool?;
    name: String;
}

contract TestContract {
    data: Layer1;

    init() {
        self.data = Layer1{
            nested: Layer2{
                optionalInt: null,
                optionalBool: null,
                name: "Test",
            },
        };
    }
}