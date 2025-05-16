struct DeepOptional {
    val: Int?;
}

struct OptionalOuter {
    inner: DeepOptional?;
}

contract OptInsideOptStruct {
    st: OptionalOuter;

    init() {
        self.st = OptionalOuter{
            inner: null
        };
    }
}