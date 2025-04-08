struct DeeplyOptional {
    val: Int?;
    sub: Inner?
}

struct Inner {
    flag: Bool;
}

contract DeepOptionalPersist {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            val: null,
            sub: Inner{flag: true},
        };
    }
}