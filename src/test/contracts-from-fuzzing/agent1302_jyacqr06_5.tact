struct Complex {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as uint32;
    i4: Int as int64;
    s: String;
    b: Bool;
    optInt: Int?;
    optBool: Bool?;
}

contract SerializeTest {
    data: Complex;

    init() {
        self.data = Complex{
            i1: 1,
            i2: -1234,
            i3: 123456,
            i4: 1234567890,
            s: "Hello⛄️",
            b: true,
            optInt: null,
            optBool: false
        };
    }

    receive() {
        let v = self.data.i4;
        let s = self.data.s;
        let o = self.data.optInt;
    }
}
