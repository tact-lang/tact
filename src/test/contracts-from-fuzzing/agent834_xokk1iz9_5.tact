struct Inner {
    s: String;
    b: Bool;
}

struct Middle {
    o: Inner?;
}

contract OptionalNested {
    m: Middle = Middle{o: null};
}
