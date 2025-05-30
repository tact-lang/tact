struct Mix {
    a: Int = 11;
    b: Bool = false;
    c: Int?;
    d: String = "hi";
    e: Bool?;
    f: Address?;
}

contract Test {
    mixed: Mix = Mix{ a: 42, d: "hello" };
    init() {}
}