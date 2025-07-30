struct Inner {
    f1: Int?;
    f2: String;
}

struct Middle {
    inr: Inner;
}

struct Outer {
    mid: Middle;
}

contract DeeplyNested {
    payload: Outer;

    init() {
        self.payload = Outer{
            mid: Middle{
                inr: Inner{
                    f1: null,
                    f2: "str",
                }
            }
        };
    }
}