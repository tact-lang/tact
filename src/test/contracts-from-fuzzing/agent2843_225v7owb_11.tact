struct Outer {
    f1: Int;
    f2: InnerOpt?;
}

struct InnerOpt {
    text: String;
    num: Int?;
}

contract Test11 {
    o: Outer;

    init() {
        self.o = Outer{
            f1: 5,
            f2: InnerOpt{
                text: "sample",
                num: null
            }
        };
    }
}