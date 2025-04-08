struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract Defaults {
    s1: S = S{ a:1, b:true, c:"hi" };
    s2: S = S{ a:2, b:false, c:"bye" };

    init() {
        self.s1 = S{ a:5, b:true, c:"override" };
    }
}