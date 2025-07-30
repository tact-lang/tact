struct FlatStrings {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract FlatStringsStorage {
    s: FlatStrings = FlatStrings{
        a: "one",
        b: "two",
        c: "three",
        d: "four"
    };
}