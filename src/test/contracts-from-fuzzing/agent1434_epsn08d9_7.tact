struct StringNest {
    a: String;
    b: String;
    c: String;
}

contract Test {
    bigString: StringNest = StringNest{
        a: "a",
        b: "b",
        c: "c"
    };

    receive() {}
}