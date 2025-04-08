struct DeepInits1 {
    p: Int = 2;
    q: String = "q";
}

struct DeepInits2 {
    inner: DeepInits1 = DeepInits1{};
}

contract DeepInitContract {
    x: DeepInits2 = DeepInits2{};
}