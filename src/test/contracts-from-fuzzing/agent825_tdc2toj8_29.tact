// Complex serialization nested
struct InnerSer {
    a: Int as uint4;
    b: Int as int4;
}

struct MiddleSer {
    i: InnerSer;
    s: String;
}

contract SerializeNested {
    m: MiddleSer;

    init() {
        self.m = MiddleSer{
            i: InnerSer{
                a: 5,
                b: -3,
            },
            s: "hi",
        };
    }
}