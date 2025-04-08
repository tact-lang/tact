// nested chain with many optional primitives
struct NestedOpts {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Address?;
}

struct NestedChain {
    nest: NestedOpts;
}

contract ManyOptNest {
    chain: NestedChain;
    init() {
        self.chain = NestedChain{ nest: NestedOpts{
            a:null,b:null,c:null,d:null
         }};
    }
}