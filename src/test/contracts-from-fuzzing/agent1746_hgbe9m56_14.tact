struct X {
    a: Int;
    b: Bool;
    c: String;
}

struct Y {
    f1: X;
    f2: X;
    f3: X;
    f4: Int;
}

contract ComboContract {
    data: Y;

    init() {
        self.data = Y{
            f1: X{a:1,b:true,c:"a"},
            f2: X{a:2,b:false,c:"b"},
            f3: X{a:3,b:true,c:"c"},
            f4: 4
        };
    }
}
