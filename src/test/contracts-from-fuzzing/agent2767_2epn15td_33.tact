// Deep nested default chain but forget to init nested inner optional, no explicit init block
struct Leaf {
    opt: Int? = null;
}

struct Mid {
    leaf: Leaf;
}

contract MissingTopInit {
    val: Mid = Mid{ leaf: Leaf{} };
}