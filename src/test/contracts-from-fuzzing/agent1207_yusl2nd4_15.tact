struct BoolDeepNest {
    flag: Bool;
}

struct Container {
    nested: BoolDeepNest;
}

contract PersistentBool {
    data: Container;

    init() {
        self.data = Container{
            nested: BoolDeepNest{
                flag: false,
            },
        };
    }
}