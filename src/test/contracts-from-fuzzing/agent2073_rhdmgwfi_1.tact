struct DeepNested {
    child: Inner;
}

struct Inner {
    subchild: SubInner;
}

struct SubInner {
    value: Int;
    optVal: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            child: Inner{
                subchild: SubInner{
                    value: 123,
                    optVal: null
                }
            }
        };
    }
}
