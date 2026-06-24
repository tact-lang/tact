struct OptionallySerialized {
    a: Int? as uint16;
    b: Int? as int32;
    c: Int? as coins;
}

contract DeepNestedSerializedOptional {
    stored: OptionallySerialized?;

    init() {
        self.stored = OptionallySerialized{
            a: 255,
            b: null,
            c: ton("1")
        };
    }

    receive() {
        self.stored = null;
    }
}