struct Annotated {
    a: Int as uint32;
    b: Int? as uint32;
}

contract OptionalSerialized {
    data: Annotated;

    init() {
        self.data = Annotated{ a: 42, b: null };
    }
}