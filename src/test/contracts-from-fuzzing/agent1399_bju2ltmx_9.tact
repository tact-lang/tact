struct Inner {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    nestedOpt: Inner?;
    message: String = "hi";
}

contract TestContract {
    bigOpt: Outer = Outer{
        nestedOpt: null,
        message: "hello"
    };
}