struct CustomSer {
    smallUint: Int as uint8;
    smallInt: Int as int16;
    normInt: Int;
}

contract CustomSerContract {
    persisted: CustomSer;

    init() {
        self.persisted = CustomSer{
            smallUint: 250,
            smallInt: -20000,
            normInt: 123456789
        };
    }
}