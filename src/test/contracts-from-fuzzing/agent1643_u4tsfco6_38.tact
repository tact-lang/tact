// hybrid struct with serialization, nested optional, default, and primitive fields
struct Hybrid {
    a: Int as uint8 = 7;
    b: Bool?;
    c: Inner?;
    d: String = "str";
}

struct Inner {
    x: Bool;
    y: Int?;
}

contract HybridTest {
    param: Hybrid;

    init() {
        self.param = Hybrid{
            b:null,c:null
        };
    }
}