struct SerializableOptional {
    foo: Int? as uint8;
}

contract SerializableOptionalContract {
    s: SerializableOptional;

    init() {
        self.s = SerializableOptional{ foo: null };
    }
}