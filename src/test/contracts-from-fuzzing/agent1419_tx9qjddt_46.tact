struct MixedSerialize {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Bool;
    e: Bool?;
}

contract MixedSerializeTest {
    s: MixedSerialize;

    init() {
        self.s = MixedSerialize{
            a:12345, b:250, c:-30000, d:true, e:null
        };
    }
}