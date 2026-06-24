struct S {
    a: Int;
    b: String;
    c: Bool;
}

contract MultipleNestedAssigns {
    s: S;

    init() {
        self.s = S{a:1,b:"s",c:true};
    }
}
