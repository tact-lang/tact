struct SelfContain {
    inner: Outer;
}

struct Outer {
    val: Int;
}

contract Recursion {
    x: SelfContain;

    init() {
        self.x = SelfContain{
            inner: Outer{ val: 5 }
        };
    }
}