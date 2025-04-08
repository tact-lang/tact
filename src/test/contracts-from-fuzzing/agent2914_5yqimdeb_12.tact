struct NestedOptImplicit {
    level: Int?;
}

struct OuterImplicit {
    nest: NestedOptImplicit?;
    other: String;
}

contract NestedOptionalImplicitContract {
    s: OuterImplicit;

    init() {
        self.s = OuterImplicit{ nest: null, other: "data" };
    }
}