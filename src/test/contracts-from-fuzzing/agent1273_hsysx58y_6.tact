struct OptionalNested {
    sub: SubStruct?;
}

struct SubStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            sub: null
        };
    }
}