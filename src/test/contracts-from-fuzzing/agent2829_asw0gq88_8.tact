struct SerializeAnnotated {
    v1: Int as uint8;
    v2: Int as int16;
}

contract AnnotatedStructInStorage {
    s: SerializeAnnotated;

    init() {
        self.s = SerializeAnnotated{
            v1: 200,
            v2: -1234,
        };
    }
}
