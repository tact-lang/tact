struct NestedDefault {
    a: Int = 1;
    b: Bool = false;
}

struct HoldNest {
    inner: NestedDefault;
    val: Int;
}

contract TestContract {
    hd: HoldNest;

    init() {
        self.hd = HoldNest{
            inner: NestedDefault{},
            val: 777
        };
    }
}