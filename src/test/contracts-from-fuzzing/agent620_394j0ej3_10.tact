struct MixedSer {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
    d: Int;
    e: Bool;
    f: Address;
}

contract TestContract {
    data: MixedSer;

    init() {
        self.data = MixedSer{
            a: 5,
            b: -1234,
            c: ton("1"),
            d: 9999,
            e: true,
            f: myAddress()
        };
    }

    receive() {
        let _ = self.data.a;
        let _ = self.data.b;
        let _ = self.data.c;
        let _ = self.data.d;
        let _ = self.data.e;
        let _ = self.data.f;
    }
}