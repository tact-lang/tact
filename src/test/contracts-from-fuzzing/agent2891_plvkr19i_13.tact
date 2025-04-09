struct StructA {
    a: Int;
    b: String;
}
struct StructB {
    c: StructA;
    d: String?;
}
struct StructC {
    e: StructB;
    f: Int?;
}
contract NestedOpts {
    store: StructC;
    init(){
        self.store = StructC{
            e: StructB{
                c: StructA{ a:1, b:"b" },
                d: null
            },
            f: null
        };
    }
}