struct DeepNested3 {
    x: Int;
    y: Bool?;
}

struct DeepNested2 {
    inner: DeepNested3;
    s: String;
}

struct DeepNested1 {
    deeper: DeepNested2;
    q: Int?;
}

contract TripleNestedStruct {
    entry: DeepNested1 = DeepNested1{
        deeper: DeepNested2{
            inner: DeepNested3{
                x: 0,
                y: null
            },
            s: ""
        },
        q: null
    };
}