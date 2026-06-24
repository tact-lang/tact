struct Flags8 {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
}

contract BitPacked {
    flags: Flags8 = Flags8{
        b1: true, b2: false, b3: true, b4: false,
        b5: true, b6: false, b7: true, b8: false
    };

    init() {
        self.flags = Flags8{
            b1: false, b2: false, b3: false, b4: false,
            b5: false, b6: false, b7: false, b8: false
        };
    }
}