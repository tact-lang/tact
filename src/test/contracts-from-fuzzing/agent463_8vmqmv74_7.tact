struct SerialOpts {
    small: Int as uint8;
    big: Int as int257;
    maybe: Int? as uint32;
}

contract TestContract {
    data: SerialOpts;

    init() {
        self.data = SerialOpts{ small: 1, big: -42, maybe: null };
    }
}