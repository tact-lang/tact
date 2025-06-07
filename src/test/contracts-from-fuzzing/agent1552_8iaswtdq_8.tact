struct A {
    i: Int;
    flag: Bool;
    text: String;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
}

contract MultiNested {
    box: B;

    init() {
        self.box = B{
            a1: A{i:1, flag:true, text:"one"},
            a2: A{i:2, flag:false, text:"two"},
            a3: A{i:3, flag:true, text:"three"},
        };
    }
}