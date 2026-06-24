// constant of complex struct containing nested optional and nested struct
struct Inner {
    flag: Bool?;
    num: Int;
}

struct Outer {
    inner: Inner;
    msg: String;
}

contract TestContract {
    const X: Outer = Outer{inner: Inner{flag:null,num:7}, msg: "hello"};
    get fun num(): Int { return self.X.inner.num; }
}
