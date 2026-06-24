struct X {
    i: Int;
    b: Bool;
    s: String;
}

contract TwoDeepNested {
    a: X;
    b: X;

    init() {
        self.a = X{i:0,b:false,s:""};
        self.b = X{i:1,b:true,s:"a"};
    }
}