struct DeepOptional {
    oo: Int?;
    so: String?;
    bo: Bool?;
}

struct Wrap {
    inner: DeepOptional;
    flag: Bool;
}

contract TestContract {
    val: Wrap = Wrap{
        inner: DeepOptional{ oo: null, so: "hi", bo: false },
        flag: true
    };
}