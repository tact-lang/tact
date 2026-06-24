struct Outer {
    middle: Middle;
}

struct Middle {
    inner: Inner;
}

struct Inner {
    flag1: Bool;
    flag2: Bool;
    str: String;
    addr: Address;
}

contract MultiNestStruct {
    val: Outer;
    init() {
        self.val = Outer{
            middle: Middle{
                inner: Inner{
                    flag1: true,
                    flag2: false,
                    str: "deeper",
                    addr: myAddress()
                }
            }
        };
    }
}