struct Mixed {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
    d: String?;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 123,
            b: -321,
            c: false,
            d: "hi"
        };
    }

    receive() {
        let _ = self.data.b;
    }
}