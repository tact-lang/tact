struct MixTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;
}

contract MixedStorage {
    data: MixTypes;

    init() {
        self.data = MixTypes{
            intVal: 5,
            boolVal: true,
            stringVal: "xyz",
            optionalInt: null,
            optionalBool: false,
            optionalString: null
        };
    }

    receive() {
        let _ = self.data;
    }
}