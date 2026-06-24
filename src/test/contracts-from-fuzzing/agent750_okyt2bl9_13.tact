struct Outer {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    val: Int?;
}

contract OptionInInnerStruct {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{flag:true, val:null}
        };
    }
}
