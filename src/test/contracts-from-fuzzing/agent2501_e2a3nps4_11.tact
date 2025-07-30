struct InnerMost {
    val: Int;
}

struct InnerMid {
    im: InnerMost;
}

struct OuterMid {
    imid: InnerMid;
}

struct OuterMost {
    omid: OuterMid;
}

contract DeepFieldChain {
    big: OuterMost;

    init() {
        self.big = OuterMost{
            omid: OuterMid{
                imid: InnerMid{
                    im: InnerMost{ val: 42 }
                }
            }
        };
    }
}