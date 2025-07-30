// Deep struct nesting with serialization overrides
struct Bottom {
    a: Int as uint8;
    b: Bool;
}
struct Middle {
    c: Bottom;
    d: Int as int16;
}
struct Top {
    e: Middle;
    f: Int as uint32;
}

contract DeepSerial {
    data: Top;

    init() {
        self.data = Top{
            e: Middle{
                c: Bottom{a:5,b:true},
                d:123
            },
            f:456
        };
    }
}