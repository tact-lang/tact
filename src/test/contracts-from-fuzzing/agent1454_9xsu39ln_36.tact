message(10) M1 {
    foo: Int = 7;
    bar: Bool?;
}

struct L2 {
    m1: M1?;
    s: String = "abc";
}

struct L1 {
    l2: L2?;
    num: Int = 5;
}

contract DeepMix {
    deep: L1 = L1{};
}