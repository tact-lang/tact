struct NestedOpt {
    inner: Bool?;
}

struct WrapNestedOpt {
    outer: NestedOpt;
}

contract NestedOptionalLayer {
    data: WrapNestedOpt;

    init() {
        self.data = WrapNestedOpt{
            outer: NestedOpt{inner: null}
        };
    }
}