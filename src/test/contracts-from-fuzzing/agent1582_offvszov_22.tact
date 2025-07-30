struct WithStringsAndBools {
    s1: String;
    s2: String?;
    b1: Bool;
    b2: Bool?;
}

contract MixedStructContract {
    field: WithStringsAndBools = WithStringsAndBools{
        s1: "abc",
        s2: null,
        b1: true,
        b2: null,
    };

    receive() {}
}