// large nested struct with optional
struct Inner {
    x: Int;
    y: Bool;
    name: String?;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract LargeNested {
    field: Outer;
    init() {
        self.field = Outer{
            m1: Middle{
                inner1: Inner{x: 1, y:true, name:null},
                inner2: Inner{x: 2, y:false, name:"foo"},
            },
            m2: Middle{
                inner1: Inner{x: 3, y:true, name:null},
                inner2: Inner{x: 4, y:false, name:"bar"},
            },
        };
    }
}
