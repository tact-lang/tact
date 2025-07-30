struct X {
    a: Int;
    b: Bool;
    c: String;
}

struct Y {
    x: X;
    d: String?;
    e: Int;
}

contract FinalContract {
    val: Y;

    init() {
        self.val = Y{ x: X{ a:1, b:true, c:"hi" }, d:null, e:42 };
    }
}
