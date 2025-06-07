struct NestedOpt {
    foo: String?;
}

contract DeepNullInit {
    persistent: NestedOpt;

    init() {
        self.persistent = NestedOpt{ foo: null };
    }
}