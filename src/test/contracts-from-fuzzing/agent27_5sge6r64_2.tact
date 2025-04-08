struct OptionalNested {
    inside: MaybeInner?;
}

struct MaybeInner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            inside: null
        };
    }
}
