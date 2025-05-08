struct DeepInner {
    foo: Int?;
    bar: Bool;
}
struct Middle {
    di: DeepInner;
    b: Bool;
}

contract DeepFields {
    m: Middle;

    init() {
        self.m = Middle{
            di: DeepInner{ foo: null, bar: false },
            b: true
        };
    }
}