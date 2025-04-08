struct MixOptionalNested {
    a: Int?;
    b: Bool?;
    inner: Nested?;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: MixOptionalNested;

    init() {
        self.data = MixOptionalNested{
            a: null,
            b: true,
            inner: Nested{ x: 3, y: false }
        };
    }
}