struct S {
    a: Int = 1;
    b: String = "";
    c: Bool?;
    d: Int?;
    e: Bool = false;
    f: String?;
    g: String = "test";
    h: Int = 123;
    i: Bool?;
    j: String?;
}

contract ManyFields {
    s: S = S{};
}