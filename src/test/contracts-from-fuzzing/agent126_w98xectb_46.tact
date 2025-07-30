struct InnerRec {
    foo: Int;
    bar: String;
}

struct OuterRec {
    ir: InnerRec;
    buzz: Bool;
    name: String;
}

contract NestedComposite {
    outer: OuterRec;

    init() {
        self.outer = OuterRec{
            ir: InnerRec{ foo:2, bar:"b" },
            buzz:true,
            name:"x"
        };
    }
}