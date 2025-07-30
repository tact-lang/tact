struct SerializeOption {
    x: Int as uint16;
    y: Bool?;
    z: String?;
}

contract SerializeOptionTest {
    data: SerializeOption;

    init() {
        self.data = SerializeOption{
            x:123,
            y:null,
            z:null
        };
    }
}