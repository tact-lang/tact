struct L1 {
    a: Int? = null;
    s: String? = null;
}

struct L2 {
    l1: L1? = null;
}

contract DeepNullDefaults {
    val: L2?;
}