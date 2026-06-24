struct Sub {
    x8: Int as int8;
    u8: Int as uint8;
    y16: Int as int16;
    u32: Int as uint32;
}

struct Main {
    sub: Sub;
    flag: Bool;
    st: String;
}

contract SerWidths {
    data: Main;

    init() {
        self.data = Main{
            sub: Sub{
                x8: -8,
                u8: 250,
                y16: -32000,
                u32: 65000
            },
            flag: true,
            st: "Hi"
        };
    }
}