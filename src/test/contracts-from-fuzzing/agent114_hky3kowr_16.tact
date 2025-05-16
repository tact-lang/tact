struct EmptyDefaults {
    s: String;
}

struct ContainerDefaults {
    inner: EmptyDefaults;
    n: Int?;
}

contract DefaultNested {
    val: ContainerDefaults;

    init() {
        self.val = ContainerDefaults{
            inner: EmptyDefaults{s: "y"},
            n: null,
        };
    }
}