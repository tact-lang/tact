struct A {
    i: Int;
    s: String;
    b: Bool;
}

contract InitDefaults {
    val: A = A{
        i: 1,
        s: "hi",
        b: false
    };
}