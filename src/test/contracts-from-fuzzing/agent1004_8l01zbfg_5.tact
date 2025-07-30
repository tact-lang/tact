struct OptInner {
    optVal: Int?;
    str: String;
}

struct Middle {
    nestedOpt: OptInner?;
}

contract TestContract {
    val: Middle;

    init() {
        self.val = Middle{
            nestedOpt: OptInner{
                optVal: null,
                str: "hi"
            }
        };
    }
}