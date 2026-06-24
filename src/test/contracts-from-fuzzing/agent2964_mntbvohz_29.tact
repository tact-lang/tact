struct S {
    flag: Bool = true;
    number: Int = 42;
    text: String = "hello";
}

contract DefaultStructInit {
    storage: S = S{};
}
