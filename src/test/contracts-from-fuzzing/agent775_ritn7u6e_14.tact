struct MaybeStruct {
    f: Int;
    g: Bool?;
}

contract OptionalStructStorage {
    stored: MaybeStruct? = null;

    init() {
        self.stored = MaybeStruct{ f: 42, g: true };
    }
}