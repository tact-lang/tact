struct OverlappingDefaults {
    foo: Int = 1;
    bar: Int = 2;
}

struct Container {
    nested: OverlappingDefaults;
    nested2: OverlappingDefaults;
}

contract DupDefaults {
    val: Container;

    init() {
        self.val = Container{
            nested: OverlappingDefaults{},
            nested2: OverlappingDefaults{}
        };
    }
}