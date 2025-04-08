struct HasBool {
    a: Bool;
    b: Bool?;
    c: Int;
}

contract B {
    f: HasBool = HasBool{ a: true, b: null, c: 7 };
}
