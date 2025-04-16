struct ComposeBig {
    i: Int;
    b: Bool;
    s: String;
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    flag: Bool;
    txt: String;
}

contract TestContract {
    val: ComposeBig;

    init() {
        self.val = ComposeBig{
            i: 1,
            b: false,
            s: "xyz",
            inner: InnerStruct{a:2, flag:true, txt:"hello"}
        };
    }
}