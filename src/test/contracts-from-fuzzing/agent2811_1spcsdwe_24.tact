struct GrandChild {
    value:Int;
}

struct Child {
    g:GrandChild;
    flag:Bool;
}

struct Parent {
    c:Child;
}

contract NestMany {
    p:Parent;

    init() {
        self.p = Parent{c:Child{g:GrandChild{value:42},flag:true}};
    }
}