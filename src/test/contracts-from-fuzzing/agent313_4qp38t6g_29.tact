struct OptionalBoolStr {
    b: Bool?;
    s: String?;
}

struct ComposeOpt {
    inner: OptionalBoolStr?;
}

contract NestedOptionalFieldTest {
    composed: ComposeOpt;

    init() {
        self.composed = ComposeOpt{inner: OptionalBoolStr{b:true,s:null}};
    }
}