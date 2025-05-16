struct S {
    flag: Bool;
    name: String;
}

contract ManyStrings {
    f1: S;
    f2: S;
    f3: S;

    init() {
        self.f1 = S { flag:true, name:"a" };
        self.f2 = S { flag:false, name:"b" };
        self.f3 = S { flag:true, name:"c" };
    }
}