struct DeepNested {
    inner1: Inner1;
}

struct Inner1 {
    opt_inner2: Inner2?;
}

struct Inner2 {
    opt_inner3: Inner3?;
}

struct Inner3 {
    deep_value: Int;
}

contract TestNested {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            inner1: Inner1{
                opt_inner2: Inner2{
                    opt_inner3: Inner3{
                        deep_value: 42
                    }
                }
            }
        };
    }
}