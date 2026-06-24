struct BigPadding {
    a: Int as uint8;
    b: Int as int257;
    c: Int as uint8;
}

contract TestContract {
    paddingData: BigPadding;

    init() {
        self.paddingData = BigPadding{
            a: 1,
            b: -42,
            c: 2
        };
    }
}