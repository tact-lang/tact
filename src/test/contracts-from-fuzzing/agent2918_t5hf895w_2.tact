struct DeepNested {
    x: Int;
    y: Bool;
}

struct Middle {
    left: DeepNested;
    right: DeepNested;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            m1: Middle{
                left: DeepNested{x:1,y:true},
                right: DeepNested{x:2,y:false}
            },
            m2: Middle{
                left: DeepNested{x:3,y:true},
                right: DeepNested{x:4,y:false}
            }
        };
    }
}