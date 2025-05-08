struct DeepOptional {
    inner: Int?;
}

struct OptionalOuter {
    nested: DeepOptional?;
    flag: Bool;
}

contract TestContract {
    val: OptionalOuter;

    init() {
        self.val = OptionalOuter{
            nested: null,
            flag: true,
        };
    }
}