struct Ser {
    x: Int as uint8;
    y: Int as int32;
    z: Int as coins;
}

contract SerialStructTest {
    foo: Ser;

    init() {
        self.foo = Ser{ x:1,y:-1,z:ton("1") };
    }
}