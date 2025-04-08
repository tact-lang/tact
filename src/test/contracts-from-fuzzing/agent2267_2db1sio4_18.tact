struct DeeplyNested {
    a: Int;
    b: String;
    c: Slice;
    d: Cell;
    e: Address;
    f: Bool;
}

struct Wrap1 { d: DeeplyNested; }
struct Wrap2 { w1: Wrap1; }
struct Wrap3 { w2: Wrap2; }

contract DeepNestContract {
    nest: Wrap3;

    init() {
        self.nest = Wrap3{
            w2: Wrap2{
                w1: Wrap1{
                    d: DeeplyNested{
                        a:1,b:"str",c:emptyCell().asSlice(),d:emptyCell(),e:myAddress(),f:true
                    }
                }
            }
        };
    }
}
