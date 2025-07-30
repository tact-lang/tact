struct OptionalStruct {
    x: Int;
}

struct ParentOpt {
    child: OptionalStruct?;
}

contract OptStructFieldTest {
    field: ParentOpt;

    init() {
        self.field = ParentOpt { child: null };
    }
}
