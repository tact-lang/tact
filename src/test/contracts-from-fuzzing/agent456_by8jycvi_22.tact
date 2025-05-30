struct SerialFormats {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int257;
}

contract SerialFormatsContract {
    data: SerialFormats;

    init() {
        self.data = SerialFormats{
            a: 0,
            b: 1,
            c: 0
        };
    }
}