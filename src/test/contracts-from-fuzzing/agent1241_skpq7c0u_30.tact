struct HasString {
    s: String;
    n: Int;
}

struct WrapOpt {
    val: HasString?;
}

contract OptionalNestedStruct {
    d: WrapOpt;

    init() {
        self.d = WrapOpt{
            val: null
        };
    }
}
