struct Child {
    a: Int;
    b: Bool;
    s: String;
}

struct Parent {
    f1: Child;
    f2: Child;
    f3: Child;
}

contract WideNested {
    p: Parent;

    init() {
        self.p = Parent{
            f1: Child{a:1,b:true,s:"one"},
            f2: Child{a:2,b:false,s:"two"},
            f3: Child{a:3,b:true,s:"three"}
        };
    }
}