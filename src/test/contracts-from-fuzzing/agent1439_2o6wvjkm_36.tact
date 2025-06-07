struct StructsInStructs {
    a: Int;
    b: Inner;
    c: Int;
    d: Inner;
}

struct Inner {
    p: Int;
}

contract InterleavedNested {
    field: StructsInStructs;

    init() {
        self.field = StructsInStructs{
            a:1, b:Inner{p:2}, c:3, d:Inner{p:4}
        };
    }
}