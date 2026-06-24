struct BigStuff {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;
    nested: Data?;
}

struct Data {
    x: Int;
    y: Bool;
}

contract TestContract {
    big: BigStuff;

    init() {
        self.big = BigStuff{
            intField: 42,
            boolField: true,
            stringField: "hello",
            addressField: myAddress(),
            optionalInt: null,
            optionalBool: false,
            optionalString: "world",
            nested: null
        };
    }

    receive() {}
}