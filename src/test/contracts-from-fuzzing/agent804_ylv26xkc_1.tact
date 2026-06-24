struct DeepNested {
    level1: Inner1;
}

struct Inner1 {
    level2: Inner2;
}

struct Inner2 {
    level3: Inner3?;
}

struct Inner3 {
    leaf1: Int;
    leaf2: String?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: Inner1{
                level2: Inner2{
                    level3: Inner3{
                        leaf1: 1,
                        leaf2: "hello",
                    }
                }
            }
        };
    }
}
