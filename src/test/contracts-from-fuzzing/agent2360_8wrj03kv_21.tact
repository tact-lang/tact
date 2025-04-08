// Optional struct with internal optional fields
struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract OptInnerBothNull {
    d: Inner?;
    init() {
        self.d = null;
    }
}