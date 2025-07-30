struct L4 {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Bool?;
}

struct L3 {
    l4: L4?;
    t3: String?;
    n3: Int?;
}

struct L2 {
    l3: L3?;
    t2: String?;
    n2: Int?;
}

contract TestContract(
    l2: L2?,
    flag: Bool?,
    msg: String?
) {
}