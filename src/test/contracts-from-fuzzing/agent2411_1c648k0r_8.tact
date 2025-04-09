struct Unit {
    val: Int;
}

struct NestedUnit {
    one: Unit;
    two: Unit;
}

contract NestedGroup {
    u1: Unit;
    group: NestedUnit;
    u2: Unit;

    init() {
        self.u1 = Unit{val: 11};
        self.group = NestedUnit{
            one: Unit{val: 22},
            two: Unit{val: 33},
        };
        self.u2 = Unit{val: 44};
    }
}