struct OptionalStruct {
    a: Int?;
}

struct WrapOptional {
    inner: OptionalStruct?;
}

contract OptionalWrapTest {
    val: WrapOptional;

    init() {
        self.val = WrapOptional{
            inner: null,
        };
    }
}