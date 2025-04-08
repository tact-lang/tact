struct DeepAndWide {
    level1: FirstLayer;
}

struct FirstLayer {
    a:Int;
    b:Bool;
    c:String;
    d:SecondLayer;
}

struct SecondLayer {
    x:Int;
    y:Bool;
    z:String;
    nested: ThirdLayer;
}

struct ThirdLayer {
    flag:Bool;
    val:Int;
}

contract Test {
    d: DeepAndWide;

    init() {
        self.d = DeepAndWide{
            level1: FirstLayer{
                a:1, b:true, c:"hi",
                d: SecondLayer{
                    x:2, y:false, z:"yo",
                    nested: ThirdLayer{flag:true, val:3}
                }
            }
        };
    }
}