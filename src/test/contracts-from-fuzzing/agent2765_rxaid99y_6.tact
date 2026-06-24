struct Inside {
    s: String;
    b: Bool;
}

struct Middle1 {
    m: Int;
    v: Inside;
}

struct Middle2 {
    t: Middle1;
    w: Bool?;
}

contract DeepTree {
    r: Middle2;

    init() {
        self.r = Middle2{
            t: Middle1{
                m: 11,
                v: Inside{
                    s: "xx",
                    b: true
                }
            },
            w: false
        };
    }
}