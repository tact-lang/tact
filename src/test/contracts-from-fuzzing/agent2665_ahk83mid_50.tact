struct OptionSer {
    o1: Int? as uint8;
    o2: Bool?;
    o3: String?;
}

contract OptionalSerialZoom {
    data: OptionSer;

    init() {
        self.data = OptionSer{
            o1: null,
            o2: null,
            o3: null,
        };
    }
}