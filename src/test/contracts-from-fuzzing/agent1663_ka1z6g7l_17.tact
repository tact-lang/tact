struct ComposeDefault {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "abc";
}

struct OuterCompose {
    composed: ComposeDefault;
}

contract NestedWithDefaults {
    data: OuterCompose;

    init() {
        self.data = OuterCompose{
            composed: ComposeDefault{}
        };
    }
}