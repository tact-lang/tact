struct NestedInner {
    xi: Int as uint8;
    yi: Int?;
}

struct NestedOuter {
    a: Bool;
    b: NestedInner;
    c: String?;
}

contract NestedFormats {
    s: NestedOuter;

    init() {
        self.s = NestedOuter{
            a: true,
            b: NestedInner{
                xi: 200,
                yi: null
            },
            c: null
        };
    }
}