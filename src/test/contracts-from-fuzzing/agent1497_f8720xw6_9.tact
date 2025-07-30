struct OptNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    optAll: OptNested = OptNested{
        a: null,
        b: null,
        c: null
    };
}