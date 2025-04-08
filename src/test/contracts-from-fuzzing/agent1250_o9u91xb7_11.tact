struct AAA { x:Int; }
struct BBB { y:Bool; }
struct CCC { z:String; }

struct Wrapper {
    a: AAA;
    b: BBB;
    c: CCC;
}

contract NestedStructsWide {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            a: AAA{ x:1 },
            b: BBB{ y:true },
            c: CCC{ z:"z" }
        };
    }
}