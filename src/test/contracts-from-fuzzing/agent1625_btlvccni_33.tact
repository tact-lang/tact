struct S {
    first: Int;
    second: Bool;
}

contract ManyVars {
    var1: S;
    var2: S;
    var3: S;
    var4: S;
    var5: S;

    init() {
        self.var1 = S{first:1,second:true};
        self.var2 = S{first:2,second:false};
        self.var3 = S{first:3,second:true};
        self.var4 = S{first:4,second:false};
        self.var5 = S{first:5,second:true};
    }
}
