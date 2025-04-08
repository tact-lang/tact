struct DeepFlags {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

struct OuterFlags {
    inner: DeepFlags;
    x: Int;
}

contract FlagContract {
    f: OuterFlags;

    init() {
        self.f = OuterFlags{
            inner: DeepFlags{a: true, b: null, c: false, d: null},
            x: 77
        };
    }
}