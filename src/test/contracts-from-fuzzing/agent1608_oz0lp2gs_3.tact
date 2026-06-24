struct DeeplyNested {
    foo: Int?;
    inner: InnerStruct;
}

struct InnerStruct {
    a: Bool?;
    leaf: LeafStruct;
}

struct LeafStruct {
    x: Int;
    y: Bool;
}

contract DeepNest {
    d: DeeplyNested = DeeplyNested{
        foo: null,
        inner: InnerStruct{
            a: true,
            leaf: LeafStruct{
                x: 7,
                y: false
            }
        }
    };

    init() {
        self.d = DeeplyNested{
            foo: 999,
            inner: InnerStruct{
                a: null,
                leaf: LeafStruct{ x: 1, y: true }
            }
        };
    }
}