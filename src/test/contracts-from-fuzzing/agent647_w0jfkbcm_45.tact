// deeply nested mixed serialization formats
struct Depth3 {
    x: Int as int4;
    y: Int as uint8;
}

struct Depth2 {
    inner: Depth3;
    flag: Bool;
}

struct Depth1 {
    child: Depth2;
    s: String;
}

contract TestContract {
    root: Depth1;

    init() {
        self.root = Depth1{
            child: Depth2{
                inner: Depth3{ x: -8, y: 255 },
                flag: true
            },
            s: "deep"
        };
    }
}