struct OptionalTuple {
    a: Int?;
    b: Bool?;
}

struct HoldsTuple {
    inner: OptionalTuple;
}

contract NestedOptionalStruct {
    val: HoldsTuple;

    init() {
        self.val = HoldsTuple{
            inner: OptionalTuple{
                a: null,
                b: null
            }
        };
    }
}