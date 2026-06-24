struct InnerMost {
    value: Int;
    desc: String;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct OuterMost {
    left: Middle;
    right: Middle;
    mark: Int;
}

contract Test8 {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            left: Middle{inner:InnerMost{value:1,desc:"L"},flag:true},
            right: Middle{inner:InnerMost{value:2,desc:"R"},flag:false},
            mark: 99
        };
    }
}