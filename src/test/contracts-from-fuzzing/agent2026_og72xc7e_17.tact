struct OptionalDeepDefault {
    inner: Inner?;
}

struct Inner {
    nested: Nested?;
}

struct Nested {
    num: Int = 0;
    str: String = "default";
    flag: Bool = false;
}

contract TestContract {
    val: OptionalDeepDefault;

    init() {
        self.val = OptionalDeepDefault{
            inner: Inner{
                nested: null
            }
        };
    }
}