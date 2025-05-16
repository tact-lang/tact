struct ManyTiny {
    a:Int as int1;
    b:Int as int2;
    c:Int as int3;
    d:Int as int4;
    e:Int as int5;
}

contract TinyInts {
    val: ManyTiny;
    init() {
        self.val = ManyTiny{ a:1,b:1,c:1,d:1,e:1 };
    }
}