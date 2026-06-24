struct EmptyInner {
    dummy: Int; // workaround, since empty structs unsupported
}

contract ManyStructs {
    a: EmptyInner;
    b: EmptyInner;
    c: EmptyInner;
    d: EmptyInner;
    e: EmptyInner;

    init() {
        self.a=EmptyInner{dummy:1};
        self.b=EmptyInner{dummy:2};
        self.c=EmptyInner{dummy:3};
        self.d=EmptyInner{dummy:4};
        self.e=EmptyInner{dummy:5};
    }
}