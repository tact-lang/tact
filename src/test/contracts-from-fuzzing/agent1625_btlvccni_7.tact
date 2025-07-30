struct OptNested {
    innermost: Int?;
}

struct ContainsOpt {
    nested: OptNested?;
}

contract OptionalNestedTest {
    dat: ContainsOpt;

    init() {
        self.dat = ContainsOpt{ nested: null };
    }
}
