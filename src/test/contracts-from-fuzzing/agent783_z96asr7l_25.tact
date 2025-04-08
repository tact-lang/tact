struct HasStr {
    s: String;
}

contract ManyStrFields {
    a: HasStr = HasStr { s: "a" };
    b: HasStr = HasStr { s: "b" };
    c: HasStr = HasStr { s: "c" };
}