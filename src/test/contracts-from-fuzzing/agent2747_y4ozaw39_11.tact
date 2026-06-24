struct NestedStringOpt {
    s: String?;
}

contract NestedOptStringTest {
    rec: NestedStringOpt;

    init() {
        self.rec = NestedStringOpt{
            s: null
        };
    }
}