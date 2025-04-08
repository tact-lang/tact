struct Sinner {
    f: Int;
}

struct Smid {
    a: Int;
    s: Sinner;
}

struct Stop {
    a: Int;
    mid: Smid;
}

contract ThreeLevels {
    val: Stop;
    init() {
        self.val = Stop { a: 1, mid: Smid { a: 2, s: Sinner { f: 3 } } };
    }
    receive() {}
}