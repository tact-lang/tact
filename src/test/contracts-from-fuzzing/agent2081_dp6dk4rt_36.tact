struct VeryNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Layer1 { v: VeryNested; }
struct Layer2 { v: Layer1; }
struct Layer3 { v: Layer2; }
struct Layer4 { v: Layer3; }

contract FourLayerNest {
    data: Layer4;
    init() {
        self.data = Layer4{
            v: Layer3{
                v: Layer2{
                    v: Layer1{
                        v: VeryNested{
                            a:1,b:true,c:"x",d:null,e:null,f:null
                        }
                    }
                }
            }
        };
    }
}