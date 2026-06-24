struct S {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

contract DefaultsAssignLater {
    data: S;

    init() {
        self.data = S{a:1,b:2,c:3,d:4,e:5,f:6};
    }
}