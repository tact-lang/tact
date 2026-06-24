// optional nested in optional nested in optional to Int
struct L3 {
    inner: L2?;
}
struct L2 {
    inner: L1?;
}
struct L1 {
    val: Int?;
}
contract Test {
    l3: L3 = L3{
        inner: null
    };
    init() {}
}