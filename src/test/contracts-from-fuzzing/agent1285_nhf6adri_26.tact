// Compose multiple nested structs with default optionals inside
struct L3 {
    val: Int? = null;
}
struct L2 {
    sub: L3;
}
struct L1 {
    sub: L2;
}

contract TestContract {
    val: L1;
    init() {
        self.val = L1{
            sub: L2{
                sub: L3{ }
            }
        };
    }
}