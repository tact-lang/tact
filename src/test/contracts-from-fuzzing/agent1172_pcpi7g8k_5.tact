struct NestedWithOptionals {
    inner: Wrapped;
}

struct Wrapped {
    x: OptionalInner;
}

struct OptionalInner {
    val: Int?;
    flag: Bool?;
}

contract NestedOptionalStorage {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            inner: Wrapped{
                x: OptionalInner{
                    val: null,
                    flag: true
                }
            }
        };
    }
}