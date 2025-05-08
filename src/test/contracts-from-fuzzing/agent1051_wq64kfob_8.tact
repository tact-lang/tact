struct DeepInner {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Address;
}

struct MidLayer {
    d1: DeepInner;
    d2: DeepInner;
}

struct OuterLayer {
    m1: MidLayer;
    m2: MidLayer;
}

contract NestedLayers {
    state: OuterLayer;

    init() {
        self.state = OuterLayer{
            m1: MidLayer{
                d1: DeepInner{a:1,b:"x",c:true,d:emptyCell(),e:myAddress()},
                d2: DeepInner{a:2,b:"y",c:false,d:emptyCell(),e:myAddress()}
            },
            m2: MidLayer{
                d1: DeepInner{a:3,b:"z",c:true,d:emptyCell(),e:myAddress()},
                d2: DeepInner{a:4,b:"w",c:false,d:emptyCell(),e:myAddress()}
            }
        };
    }
}