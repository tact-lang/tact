struct DeepOption {
    s1: InnerOption?;
}

struct InnerOption {
    s2: LeafOption?;
}

struct LeafOption {
    val: Int?;
}

contract DeepOptionContract {
    val: DeepOption = DeepOption{ s1: null };
}