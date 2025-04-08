struct OptionalDeepNested {
    nested: Inner?;
}

struct Inner {
    nested2: Inner2?;
}

struct Inner2 {
    n3: Int?;
}

contract TestContract {
    data: OptionalDeepNested;

    init() {
        self.data = OptionalDeepNested{
            nested: Inner{
                nested2: Inner2{
                    n3: 42
                }
            }
        };
    }
}