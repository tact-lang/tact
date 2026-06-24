// nested struct with multiple optionals inside optional
struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Wrapper {
    inn: Inner?;
    d: Bool;
}

contract MixNestOpt {
    w: Wrapper?;

    init() {
        self.w = null;
    }
}