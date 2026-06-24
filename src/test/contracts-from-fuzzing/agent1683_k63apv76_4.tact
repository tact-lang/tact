struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

contract TestContract {
    val: Inner = Inner{ a: 5, b: false, c: "test", d: null };
}