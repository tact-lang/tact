struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterOptional {
    foo: Int?;
    bar: DeepOptional?;
}

contract OptTest {
    val: OuterOptional;

    init() {
        self.val = OuterOptional{
            foo: null,
            bar: DeepOptional{
                a: 1,
                b: null,
                c: null,
            },
        };
    }
}