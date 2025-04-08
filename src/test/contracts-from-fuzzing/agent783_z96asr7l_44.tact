struct InnerStr {
    name: String;
}

contract ManyNestedStr {
    a: InnerStr = InnerStr { name: "a" };
    b: InnerStr = InnerStr { name: "b" };
    c: InnerStr = InnerStr { name: "c" };
}