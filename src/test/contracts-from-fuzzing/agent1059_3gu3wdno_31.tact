struct S{
    a:Int;
    b:Int;
}

contract AssignDefaultNested {
    s: S;
    init() {
        self.s = S{ a: 5, b: 7 };
    }
}