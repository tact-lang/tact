struct Inner {
    val: Int?;
}

struct Outer {
    i: Int?;
    s: String?;
    inner: Inner?;
}

contract OptionNestedStruct {
    myData: Outer;

    init() {
        self.myData = Outer{
            i: null,
            s: null,
            inner: null
        };
    }

    receive() {}
}
