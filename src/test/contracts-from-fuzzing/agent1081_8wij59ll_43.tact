struct RecInits {
    v: Int;
    b: Bool;
    s: String;
}

contract InitThreeWays {
    a: Int;
    st: RecInits;
    opt: Bool?;

    init() {
        self.a = 1;
        self.st = RecInits{ v:5, b:true, s:"zz" };
        self.opt = null;
    }
}