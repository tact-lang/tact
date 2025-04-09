struct OptionalSerialization {
    o1: Int? as uint32;
    o2: Bool?;
    o3: String?;
}

contract OptionalSer {
    data: OptionalSerialization;

    init() {
        self.data = OptionalSerialization{
            o1: null,
            o2: null,
            o3: null
        };
    }
}