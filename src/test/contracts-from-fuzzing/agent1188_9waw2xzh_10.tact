struct OptionalDeep {
    nested: InnerOptional?;
}

struct InnerOptional {
    flag: Bool;
    val: Int?;
}

contract OptDeepTest {
    storage: OptionalDeep;

    init() {
        self.storage = OptionalDeep{nested: null};
    }
}