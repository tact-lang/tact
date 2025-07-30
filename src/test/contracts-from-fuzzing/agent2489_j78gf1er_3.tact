struct NestedOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            o1: null,
            o2: true,
            o3: Inner{ val: 5 }
        };
    }
}
