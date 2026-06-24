struct D3 {
    k: Int? = null;
    flag: Bool = false;
}

struct D2 {
    node: D3 = D3{};
    text: String = "deep";
}

struct D1 {
    child: D2 = D2{};
    val: Int = 777;
}

contract VeryDeep {
    tree: D1 = D1{};

    init() {}
}