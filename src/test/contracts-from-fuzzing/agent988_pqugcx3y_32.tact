struct SerializeOpt {
    a: Int? as int64;
    b: Bool?;
}

contract OptSerialStruct {
    data: SerializeOpt;

    init() {
        self.data = SerializeOpt{
            a: null,
            b: true
        };
    }
}