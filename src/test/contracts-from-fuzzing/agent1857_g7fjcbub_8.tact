struct NestedDefault {
    val: Int = 42;
}

struct S {
    nest: NestedDefault = NestedDefault{};
    optInt: Int?;
}

contract DefNest {
    f: S;

    init() {
        self.f = S{
            optInt: null
        };
    }
}