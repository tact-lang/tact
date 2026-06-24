struct DeeplyNested {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
}

struct Inner2 {
    inner3: Inner3;
}

struct Inner3 {
    val: Int;
}

contract VeryDeepNestedManyLevels {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            inner1: Inner1{
                inner2: Inner2{
                    inner3: Inner3{
                        val: 123
                    }
                }
            }
        };
    }
}