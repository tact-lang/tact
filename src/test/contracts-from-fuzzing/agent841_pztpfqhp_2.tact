struct Inner {
    b: Bool;
    s: String;
    n: Int?;
}

struct Outer {
    inn: Inner;
    t: Int;
}

contract DeepTest {
    val: Outer;
    init() {
        self.val = Outer{
            inn: Inner{b:true, s:"x", n:null},
            t: 123
        };
    }
}
