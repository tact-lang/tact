struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    i: Inner;
    s: String;
}

struct Outer {
    m: Middle;
    flag: Bool;
}

contract TestContract {
    o1: Outer;
    o2: Outer;

    init() {
        self.o1 = Outer{
            m: Middle{i: Inner{a:1,b:true}, s:"x"},
            flag: true
        };
        self.o2 = Outer{
            m: Middle{i: Inner{a:2,b:false}, s:"y"},
            flag: false
        };
    }
}