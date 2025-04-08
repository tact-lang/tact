struct Sub {
    s: String?;
}

struct Outer {
    f: Int;
    sub: Sub?;
    flag: Bool;
}

contract DeepOptionalNested {
    outerData: Outer;

    init() {
        self.outerData = Outer{
            f: 5,
            sub: Sub{s: null},
            flag: true
        };
    }

    receive() {
        if (self.outerData.sub != null) {
            let _ = self.outerData.sub!!.s;
        }
    }
}