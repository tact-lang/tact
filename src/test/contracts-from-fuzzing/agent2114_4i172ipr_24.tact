struct NestedWithDefaults {
    a: Int = 1;
    b: Bool = true;
}

struct ContainerDefaults {
    f1: NestedWithDefaults;
    f2: NestedWithDefaults = NestedWithDefaults{ a:2, b:false };
}

contract DefaultsInStructs {
    data: ContainerDefaults;

    init() {
        self.data = ContainerDefaults{
            f1: NestedWithDefaults{ a:3, b:true },
            f2: NestedWithDefaults{ a:4, b:false }
        };
    }
}