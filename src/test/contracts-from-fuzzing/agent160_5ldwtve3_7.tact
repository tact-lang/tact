struct DeepOptional {
    nested: Outer?;
}

struct Outer {
    val: Int;
}

contract TestDeepOpt {
    data: DeepOptional;
    init() {
        self.data = DeepOptional{
            nested: null,
        };
    }
}