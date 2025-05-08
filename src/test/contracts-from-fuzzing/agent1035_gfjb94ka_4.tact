struct DeepNested {
    a: Int;
    b: Bool;
    c: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract NestedStorage {
    deep: DeepNested = DeepNested{ a:1, b:true, c:Inner{ x:2, y:false } };
    init() {
        self.deep = DeepNested{ a:3, b:false, c:Inner{ x:4, y:true } };
    }
    receive() {}
}