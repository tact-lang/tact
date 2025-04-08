struct Outer2 {
    a: Int;
    b: Bool;
    nested: Inner2Opt;
}

struct Inner2Opt {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract DeepOptionInStruct {
    data: Outer2;
    init() {
        self.data = Outer2{
            a:1, b:true,
            nested: Inner2Opt{ x:null, y:null, z:null }
        };
    }
}