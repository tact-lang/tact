struct InnerMost {
    v: Int;
}

struct Inner {
    im: InnerMost;
}

struct Container {
    i: Inner;
}

contract DeeplyNestedStruct {
    field: Container = Container{
        i: Inner{
            im: InnerMost{v: 42}
        }
    };

    init() {
        self.field = Container{
            i: Inner{
                im: InnerMost{v: 100}
            }
        };
    }
}