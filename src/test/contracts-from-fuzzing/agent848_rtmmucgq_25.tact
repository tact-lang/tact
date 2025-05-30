struct NestedMultiLevel {
    foo: Int;
    nested1: Inner1;
}

struct Inner1 {
    a: Int;
    nested2: Inner2;
}

struct Inner2 {
    b: Bool;
    nested3: Inner3;
}

struct Inner3 {
    c: String?;
}

contract MultiLevelNested {
    data: NestedMultiLevel;

    init() {
        self.data = NestedMultiLevel{
            foo:123,
            nested1: Inner1{
                a:456,
                nested2: Inner2{
                    b:true,
                    nested3: Inner3{
                        c: "deep"
                    }
                }
            }
        };
    }
}