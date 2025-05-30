struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    f1: S;
    f2: S;
    f3: S;
    f4: S;
    f5: S;
    f6: S;

    init() {
        let s = S{a:1,b:true,c:"test"};
        self.f1 = s;
        self.f2 = s;
        self.f3 = s;
        self.f4 = s;
        self.f5 = s;
        self.f6 = s;
    }

    receive() {}
}