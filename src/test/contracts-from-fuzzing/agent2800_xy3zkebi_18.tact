struct NestedDefault {
    a: Int = 1;
    b: Bool = false;
}

struct Container {
    fld1: NestedDefault;
    fld2: NestedDefault = NestedDefault{};
}

contract Test {
    con: Container;

    init() {
        self.con = Container{fld1: NestedDefault{}, fld2: NestedDefault{}};
    }
}