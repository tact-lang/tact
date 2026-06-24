struct ManyNestedDefaults {
    s1: Def1;
}

struct Def1 {
    s2: Def2;
}

struct Def2 {
    i: Int = 42;
    b: Bool = true;
}

contract NestedWithDefaults {
    data: ManyNestedDefaults;
    init() {
        self.data = ManyNestedDefaults{
            s1: Def1{ s2: Def2{} }
        };
    }
}