struct A {
    flag: Bool;
    val: Int;
}

struct B {
    x: A;
    y: A;
}

struct C {
    m: B;
    n: B;
}

contract Multinode {
    root: C;

    init() {
        self.root = C{
            m: B{ x: A{flag:true,val:1}, y: A{flag:true,val:2} },
            n: B{ x: A{flag:false,val:3}, y: A{flag:false,val:4} }
        };
    }
}