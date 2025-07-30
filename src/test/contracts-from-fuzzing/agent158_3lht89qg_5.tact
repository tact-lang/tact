struct NestedDefaultOpt {
    fieldA: Int? = null;
    fieldB: Bool? = true;
    fieldC: String? = null;
}

struct Container {
    nested: NestedDefaultOpt;
}

contract OptionalDefaults {
    val: Container;
    init() {
        self.val = Container{
            nested: NestedDefaultOpt{}
        };
    }
}