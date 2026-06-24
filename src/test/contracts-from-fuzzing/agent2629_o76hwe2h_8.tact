struct DeepOptional {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Slice?;
    opt5: Cell?;
}

struct Container {
    inner: DeepOptional?;
    str: String;
}

contract OptionalContainer {
    state: Container = Container{
        inner: null,
        str: "abc"
    };

    init() {}
}