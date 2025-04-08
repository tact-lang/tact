struct Innermost {
    d: Int;
}

struct Inner {
    c: Innermost;
}

struct Mid {
    b: Inner;
}

struct Outer {
    a: Mid;
}

contract SuperNested {
    val: Outer;
    init() {
        self.val = Outer{
            a:Mid{
                b:Inner{
                    c:Innermost{d:123}
                }
            }
        };
    }
}
