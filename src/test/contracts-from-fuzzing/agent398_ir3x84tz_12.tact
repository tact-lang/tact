struct Inner { v: Int }
struct Outer { innerOpt: Inner? }

contract NestedOptionalStructs {
    outerOpt: Outer?;

    init() {
        self.outerOpt = Outer{ innerOpt: Inner{ v: 77 } };
    }
}