struct S1 { x: Int; y: Bool; z: String?; }
struct S2 { s1: S1; s2: S1; }

contract DoubleStruct {
    data: S2;
    init() {
        self.data = S2{
            s1: S1{ x:1, y:true, z:"hi" },
            s2: S1{ x:2, y:false, z:null },
        };
    }
}
