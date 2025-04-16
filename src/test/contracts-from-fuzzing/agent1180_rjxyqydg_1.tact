struct NestedInner {
    a: Int;
    b: Bool;
    s: String;
}

struct NestedOuter {
    ni: NestedInner;
    x: String;
    flag: Bool;
}

contract StorageTest {
    val: NestedOuter;
    
    init() {
        self.val = NestedOuter{
            ni: NestedInner{
                a: 1,
                b: true,
                s: "hi",
            },
            x: "hello",
            flag: false,
        };
    }
}
