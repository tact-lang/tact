struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    s: String;
    nested: Inner2?;
}

struct Inner2 {
    flag: Bool;
}

contract TestContract {
    d: DeepOptional;
    init() {
        self.d = DeepOptional{inner: Inner{s:"hi", nested: Inner2{flag:true}}};
    }
}