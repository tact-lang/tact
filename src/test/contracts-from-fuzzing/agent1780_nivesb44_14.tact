struct SubInner {
    enabled: Bool;
}

struct Inner {
    sub: SubInner;
}

struct Outer {
    inr: Inner;
}

contract MultiLayer {
    outer: Outer;

    init() {
        self.outer = Outer{
            inr: Inner{
                sub: SubInner{
                    enabled: true
                }
            }
        };
    }
}