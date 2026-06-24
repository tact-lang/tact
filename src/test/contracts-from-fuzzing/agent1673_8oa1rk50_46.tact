struct NestedManyDefaults {
    s1: Int = 1;
    s2: Int = 2;
    s3: Int = 3;
}

struct ContainerDefaults {
    nested: NestedManyDefaults;
}

contract ContainerDefaultsTest {
    data: ContainerDefaults;

    init() {
        self.data = ContainerDefaults{nested:NestedManyDefaults{}};
    }
}