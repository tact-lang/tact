struct NestedDeepOpt{
    foo: Int?;
}

struct HasNestedDeepOpt{
    nested: NestedDeepOpt;
}

contract OptionalDefaults {
    val: HasNestedDeepOpt;

    init() {
        self.val = HasNestedDeepOpt{ nested: NestedDeepOpt{ foo: null } };
    }
}