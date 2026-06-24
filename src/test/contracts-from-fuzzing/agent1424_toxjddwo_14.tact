struct InnerMost {
    val: Int?;
    flag: Bool;
}

struct MiddleOne {
    im: InnerMost;
    text: String;
}

struct MiddleTwo {
    im: InnerMost;
    enabled: Bool;
}

struct Container {
    mid1: MiddleOne;
    mid2: MiddleTwo;
    desc: String;
}

contract SharedStructsTest {
    state: Container;

    init() {
        self.state = Container{
            mid1: MiddleOne{im: InnerMost{val:null, flag:true}, text:"t"},
            mid2: MiddleTwo{im: InnerMost{val:5, flag:false}, enabled:true},
            desc: "desc"
        };
    }
}