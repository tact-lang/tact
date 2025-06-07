struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

struct Inner3 {
    c: String;
}

struct Composed {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract CompStruct {
    cmp: Composed;

    init() {
        self.cmp = Composed{
            i1: Inner1{a:1},
            i2: Inner2{b:true},
            i3: Inner3{c:"str"}
        };
    }
}