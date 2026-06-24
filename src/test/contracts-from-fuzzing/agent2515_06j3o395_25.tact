struct NestedSerial {
    a: Int as uint8;
    b: Bool;
    c: String;
}

struct OuterSerial {
    s: NestedSerial;
    x: Int as uint4;
}

contract SerialContract {
    data: OuterSerial;
    init() {
        self.data = OuterSerial{
            s: NestedSerial{a:5, b:true, c:"X"},
            x: 9
        };
    }
}
