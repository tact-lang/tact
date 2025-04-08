struct DeepOptional {
    foo: Inner?;
}

struct Inner {
    bar: Int?;
    baz: Bool;
}

contract Test {
    val: DeepOptional;

    init() {
        self.val = DeepOptional{
            foo: Inner{
                bar: null,
                baz: true
            }
        };
    }
}