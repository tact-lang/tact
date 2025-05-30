struct DeepOptional {
    optLevel1: Inner?;
}

struct Inner {
    optLevel2: Inner2?;
}

struct Inner2 {
    val: Int;
}

contract StructDeepOptional {
    s: DeepOptional;

    init() {
        self.s = DeepOptional{
            optLevel1: null
        };
    }
}