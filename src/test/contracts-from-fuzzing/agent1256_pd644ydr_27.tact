// Test large nested structs, deep optional, and mixed
struct InnerLevel {
    x: Int;
    y: String?;
}

struct MiddleLevel {
    inn: InnerLevel;
    z: Bool?;
}

struct OuterLevel {
    mid: MiddleLevel;
    s: String;
    n: Int?;
}

contract FuzzEdgeCase {
    stored: OuterLevel;

    init() {
        self.stored = OuterLevel{
            mid: MiddleLevel{
                inn: InnerLevel{ x:42, y:null },
                z:true
            },
            s: "hello",
            n: null
        };
    }
}
