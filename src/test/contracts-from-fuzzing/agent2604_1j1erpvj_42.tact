struct TinySer {
    a: Int as int1;
    b: Int as int2;
    c: Int as int3;
}

contract TinySerialize {
    foo: TinySer;

    init() {
        self.foo = TinySer{ a:1,b:1,c:1 };
    }
}