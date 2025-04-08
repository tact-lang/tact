struct Middle {
    f1: Int;
    f2: Bool;
}

struct Container {
    m1: Middle;
    m2: Middle;
    m3: Middle;
}

contract NestedDefaults {
    data: Container;

    init() {
        self.data = Container{
            m1: Middle{f1:1,f2:true},
            m2: Middle{f1:2,f2:false},
            m3: Middle{f1:3,f2:true}
        };
    }
}
