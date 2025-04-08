struct InnerStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    s: InnerStruct = InnerStruct{
        a: 10,
        b: true,
        c: "abc"
    };
    init() {}
}