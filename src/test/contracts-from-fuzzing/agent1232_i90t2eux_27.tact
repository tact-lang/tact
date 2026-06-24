struct NestedMix1 {
    a: Int;
    b: Bool;
    c: String;
}

struct NestedMix2 {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract ManyNestMix {
    n1: NestedMix1;
    n2: NestedMix2;

    init() {
        self.n1 = NestedMix1{
            a:7, b:true, c:"nested1"
        };
        self.n2 = NestedMix2{
            x:null, y:false, z:"nested2"
        };
    }
}