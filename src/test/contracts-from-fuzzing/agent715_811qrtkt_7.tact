struct Flat {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
}

contract FlatStorage {
    storage: Flat;
    init() {
        self.storage = Flat{
            intField: 123,
            boolField: true,
            stringField: "hello",
            optInt: null,
            optBool: false
        };
    }
}