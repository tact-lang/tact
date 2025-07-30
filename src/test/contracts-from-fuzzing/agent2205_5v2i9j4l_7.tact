struct InnerMost {
    flag: Bool = false;
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract VeryDeepNested {
    nest: Outer;

    init() {
        self.nest = Outer{
            mid: Middle{
                im: InnerMost{flag:true}
            }
        };
    }
}