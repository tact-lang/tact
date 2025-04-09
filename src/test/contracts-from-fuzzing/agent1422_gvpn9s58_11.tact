struct Outer {
    nested: Inner;
    val: Int;
}

struct Inner {
    deep: InnerMost;
}

struct InnerMost {
    flag: Bool;
}

contract ManyNested {
    o: Outer;
    init() {
        self.o = Outer{
            nested: Inner{
                deep: InnerMost{
                    flag: true
                }
            },
            val: 42
        };
    }
}