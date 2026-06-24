// nested structs with edge serialization
struct SerSub {
    a: Int as uint8;
    b: Int as int16;
}

struct SerTop {
    s: SerSub;
    x: Int as uint4;
}

contract NestSerialize {
    data: SerTop;
    init() {
        self.data = SerTop{
            s: SerSub{a:1,b:-5},
            x:7
        };
    }
}