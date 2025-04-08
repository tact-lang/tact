// Optional struct with several nested optional primitives
struct OptionalComplex {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract RootOptionalComplex {
    val: OptionalComplex?;

    init() {
        self.val = OptionalComplex{
            i: null,
            s: "foo",
            b: null
        };
    }
}