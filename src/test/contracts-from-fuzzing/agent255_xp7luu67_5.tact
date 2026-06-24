struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

struct Middle {
    x: Inner;
    y: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            m1: Middle{
                x: Inner{a:1, b:true, c:null},
                y: Inner{a:2, b:false, c:null}
            },
            m2: Middle{
                x: Inner{a:3, b:true, c:null},
                y: Inner{a:4, b:false, c:null}
            }
        };
    }
}