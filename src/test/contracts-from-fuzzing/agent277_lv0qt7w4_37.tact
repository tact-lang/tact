struct S1 {
    x:Int; y:String; z:Bool?;
}

struct S2 {
    p:S1; q:String?;
}

contract Test {
    val: S2;
    init() {
        self.val = S2{
            p: S1{ x: 7, y: "hi", z: null },
            q: null
        };
    }
}