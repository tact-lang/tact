struct Outer {
    inner: Inner;
}

struct Inner {
    s: String;
    flag: Bool;
    opt: Int?;
}

contract StringInStruct {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                s: "test",
                flag: false,
                opt: null
            }
        };
    }
}
