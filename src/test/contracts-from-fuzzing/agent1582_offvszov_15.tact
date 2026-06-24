struct NestedStrings {
    a: String;
    b: String;
    c: String;
}

contract ContractWithStrings {
    strings: NestedStrings = NestedStrings{
        a: "One",
        b: "Two",
        c: "Three",
    };

    receive() {}
}