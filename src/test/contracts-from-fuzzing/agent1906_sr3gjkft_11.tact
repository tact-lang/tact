struct Medium {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
}

struct Outer {
    x: Medium;
    y: Medium;
    z: Medium;
}

contract MultiStruct {
    data: Outer;

    init() {
        self.data = Outer{
            x: Medium{f1:1,f2:2,f3:3,f4:4},
            y: Medium{f1:5,f2:6,f3:7,f4:8},
            z: Medium{f1:9,f2:10,f3:11,f4:12},
        };
    }
}
