struct NestedInner {
    a: Int;
    b: Bool;
    c: String?;
}

struct NestedOuter {
    foo: Int;
    bar: NestedInner;
    baz: Bool;
}

contract DeepStructStorage {
    val: NestedOuter; 
    
    init() {
        self.val = NestedOuter{
            foo: 1,
            bar: NestedInner{
                a: 2,
                b: true,
                c: "test",
            },
            baz: false,
        };
    }
}
