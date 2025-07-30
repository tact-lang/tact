struct S {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract X {
    s: S;
    optS: S?;

    init() {
        self.s = S{f1:1,f2:true,f3:"hi"};
        self.optS = null;
    }

    receive() {
        self.optS = self.s;
    }
}