// Intentionally large nested structs with optional layers and mixed types
struct S1 { 
    a: Int; 
    b: Bool?; 
}

struct S2 {
    s1: S1?;
    str: String?;
}

struct S3 {
    x: S2?;
    y: Int?;
}

contract DeepOptionalNest {
    data: S3;

    init() {
        self.data = S3{
            x: null,
            y: null,
        };
    }
    receive() {}
}