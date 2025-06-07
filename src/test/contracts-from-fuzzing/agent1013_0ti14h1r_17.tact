struct CC {
    a:Int;
    b:Int;
}

struct BB {
    x:CC;
    y:CC;
}

struct AA {
    one:BB;
    two:BB;
}

contract MultipleNest {
    val: AA;

    init() {
        self.val = AA{
            one: BB{ x:CC{a:1,b:2}, y:CC{a:3,b:4} },
            two: BB{ x:CC{a:5,b:6}, y:CC{a:7,b:8} }
        };
    }
}
