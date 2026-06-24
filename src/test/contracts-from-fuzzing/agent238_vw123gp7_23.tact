struct NullableNested {
    a: Int?;
    b: Bool?;
    s: String?;
    inner: Inner?
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract NullableInside {
    d: NullableNested;

    init() {
        self.d = NullableNested{
            a:null,b:null,s:null,inner:null
        };
    }
}