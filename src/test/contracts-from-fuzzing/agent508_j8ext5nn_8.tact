struct Sub {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    f1: Sub;
    f2: Sub;
    f3: Sub;
    f4: Sub;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            f1: Sub{a:1,b:true,c:"a"},
            f2: Sub{a:2,b:false,c:"b"},
            f3: Sub{a:3,b:true,c:"c"},
            f4: Sub{a:4,b:false,c:"d"}
        };
    }
}
