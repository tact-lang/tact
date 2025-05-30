struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: String?;
    e: Bool?;
    f: Bool?;
    g: String?;
    h: Int?;
    i: Bool?;
    j: Int?;
    k: String?;
    l: Bool?;
    m: String?;
    n: Int?;
    o: Bool?;
    p: Int?;
    q: Bool?;
    r: Int?;
    s: String?;
    t: Bool?;
}

contract ManyOptContract {
    lots: ManyOptionals = ManyOptionals{};
    init() {}
}