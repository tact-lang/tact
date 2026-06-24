struct LargeInner { p: Int; q: Bool; r: String; }

struct Outer {
    inner1: LargeInner;
    inner2: LargeInner;
    inner3: LargeInner;
    inner4: LargeInner;
    inner5: LargeInner;
}

contract ManyNestedStructs {
    d: Outer;

    init() {
        self.d = Outer {
            inner1: LargeInner { p:1,q:true,r:"a" },
            inner2: LargeInner { p:2,q:false,r:"b" },
            inner3: LargeInner { p:3,q:true,r:"c" },
            inner4: LargeInner { p:4,q:false,r:"d" },
            inner5: LargeInner { p:5,q:true,r:"e" }
        };
    }
}