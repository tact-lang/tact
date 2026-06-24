struct SI {
    x: Int as int16;
    y: Int as uint5;
}

struct WrapOpt {
    data: SI?;
}

contract OptSerialChain {
    hold: WrapOpt?;

    init() {
        self.hold = null;
    }
}