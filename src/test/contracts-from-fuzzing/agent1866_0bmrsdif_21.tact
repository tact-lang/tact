// Deep nest optional inner struct where inner has optionals also
struct InnerMost {
    foo: Int?;
    bar: Bool?;
}

struct Mid {
    inner: InnerMost?;
    val: Int;
}

struct Outer {
    mid: Mid?;
    flag: Bool;
}

contract DeepOptional {
    d: Outer;

    init() {
        self.d = Outer{
            mid: null,
            flag: true,
        };
    }
}