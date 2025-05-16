struct InnerMost {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
}

struct Middle {
    nest: InnerMost;
    optNest: InnerMost?;
    anotherInt: Int;
}

struct Outer {
    mid: Middle;
    optMid: Middle?;
    flag: Bool;
}

contract TestContract {
    bigState: Outer;

    init() {
        self.bigState = Outer{
            mid: Middle{
                nest: InnerMost{
                    intVal: 10,
                    boolVal: false,
                    strVal: "deep",
                    optInt: null
                },
                optNest: null,
                anotherInt: 5
            },
            optMid: null,
            flag: true
        };
    }
}