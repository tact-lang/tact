struct S {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
}

contract TestContract {
    s: S = S{ a: 123 };

    init() {}
}