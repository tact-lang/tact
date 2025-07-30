// optional nested with explicit serialization inside
struct InnerS {
    a: Int as uint8;
    b: Bool;
}

struct OuterS {
    inner: InnerS?;
    hello: String;
}

contract NestOptionSerial {
    data: OuterS;

    init() {
        self.data = OuterS{
            inner: InnerS{a:123, b:true},
            hello: "world",
        };
    }
}