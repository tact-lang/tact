struct DeepOpt {
    text: String?;
}

struct Wrapper {
    d: DeepOpt?;
    number: Int;
}

contract PartialNestedOptional {
    data: Wrapper = Wrapper{
        d: null,
        number: 123
    };
}