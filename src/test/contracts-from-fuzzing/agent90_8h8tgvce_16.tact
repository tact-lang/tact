struct Serials {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int257;
    e: Int;
}

contract TestStorage {
    ser: Serials = Serials{
        a: 1,
        b: -2,
        c: 3,
        d: -4,
        e: 5
    };

    receive() {
        let z = self.ser;
    }
}