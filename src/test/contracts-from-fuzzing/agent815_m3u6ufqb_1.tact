struct InnerMost {
    val: Int;
}

struct Inner {
    optVal: InnerMost?; 
}

struct Outer {
    nested: Inner;
}

contract MultiLevelOptional {
    storage: Outer;

    init() {
        self.storage = Outer{
            nested: Inner{
                optVal: InnerMost{ val: 42 }
            }
        };
    }
}