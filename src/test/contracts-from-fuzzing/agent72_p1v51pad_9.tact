struct PackedStruct {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int1;
    d: Int as int257;
    e: Bool;
}

contract TestContract {
    packed: PackedStruct = PackedStruct{
        a: 7,
        b: 255,
        c: -1,
        d: 123456,
        e: true
    };

    receive() {
        let _ = self.packed;
    }
}