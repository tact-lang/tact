struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    val: Int?;
}

contract Test {
    dopt: DeepOptional;

    init() {
        self.dopt = DeepOptional{
            inner: Inner{
                val: 123
            }
        };
    }
}