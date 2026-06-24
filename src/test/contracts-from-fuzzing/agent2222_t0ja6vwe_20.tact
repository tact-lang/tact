struct Mid {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    m: Mid;
    opt: Int?;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{ m: Mid{ a:1, b:true, c:"hi" }, opt:null };
    }
}