struct OptionalInner { val: Int?; }
struct OptionalMid { inner: OptionalInner?; }

contract OptionalNestedContract {
    nested: OptionalMid?;

    init() {
        self.nested = OptionalMid{
            inner: OptionalInner{ val: 42 }
        };
    }
}