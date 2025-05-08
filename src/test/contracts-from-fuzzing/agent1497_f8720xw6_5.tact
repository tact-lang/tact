struct Inner {
    nestedOpt: Int?;
    flag: Bool;
    txt: String;
}

contract TestContract {
    data: Inner = Inner{
        nestedOpt: null,
        flag: true,
        txt: "Hello"
    };
}