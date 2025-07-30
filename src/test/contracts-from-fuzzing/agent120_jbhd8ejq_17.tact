struct Nested {
    n1: Int;
    n2: Int;
}

struct WithOption {
    optStruct: Nested?;
    optInt: Int?;
}

contract Test {
    f: WithOption = WithOption{
        optStruct: null,
        optInt: null,
    };
}