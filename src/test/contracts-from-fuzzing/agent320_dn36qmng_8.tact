struct InnerMost {
    z: Int;
}

struct Middle {
    im: InnerMost;
    flag: Bool?;
}

struct Outer {
    m: Middle;
    text: String;
}

contract Test {
    dat: Outer;

    init() {
        self.dat = Outer{
            m: Middle{im: InnerMost{z:42}, flag:null},
            text: "hello",
        };
    }
}