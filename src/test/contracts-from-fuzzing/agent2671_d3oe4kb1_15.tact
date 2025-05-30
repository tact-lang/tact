struct SerializeOpt {
    a: Int? as uint8;
    b: Bool?;
}

contract OptSerialization {
    val: SerializeOpt;

    init() {
        self.val = SerializeOpt{
            a: null,
            b: true
        };
    }
}