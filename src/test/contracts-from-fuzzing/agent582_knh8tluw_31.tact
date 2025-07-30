struct OuterMost {
    o: Middle;
}

struct Middle {
    m: Inner;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract MultiplyNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            o: Middle{
                m: Inner{
                    x:10,
                    y:null
                }
            }
        };
    }
}
