struct Inner {
    label: String = "label";
    index: Int = 99;
    flag: Bool = true;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

contract DeepNest {
    data: Middle;
    
    init() {
        self.data = Middle{
            inner1: Inner{label: "l1", index: 1, flag: false},
            inner2: Inner{label: "l2", index: 2, flag: true}
        };
    }
}