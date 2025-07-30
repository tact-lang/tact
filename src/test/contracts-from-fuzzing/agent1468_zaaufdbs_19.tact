struct Serial {
    a: Int as uint64;
    b: Int as int32;
    c: Int as uint8;
    d: Bool;
    e: Bool;
}

contract TestSerial {
    packed: Serial;

    init() {
        self.packed = Serial{
            a:1, b:-2, c:3, d:true, e:false
        };
    }
}