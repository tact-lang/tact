struct SerializeOpt {
    x: Int as uint64;
    y: Int? as uint32;
    flag: Bool;
    maybeFlag: Bool?;
    text: String;
}

contract TestContract {
    so: SerializeOpt;

    init() {
        self.so = SerializeOpt{
            x: 9999999999,
            y: null,
            flag: true,
            maybeFlag: null,
            text: "serialization"
        };
    }
}