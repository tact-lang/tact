struct DeepOpts {
    a: Int?;
    b: Int?;
    c: InnerOptional?;
}

struct InnerOptional {
    x: Int?;
    y: Int?;
}

contract DeepOptionalTest {
    val: DeepOpts;

    init() {
        self.val = DeepOpts{
            a: null,
            b: 10,
            c: InnerOptional{ x: null, y: 20 }
        };
    }
}