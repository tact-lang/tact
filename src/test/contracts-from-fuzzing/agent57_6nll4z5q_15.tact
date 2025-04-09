struct L1 {
    val: Int?;
}
struct L2 {
    nested: L1?;
}
struct L3 {
    nested: L2?;
}

contract MultiNull {
    data: L3?;

    init() {
        self.data = L3{
            nested: L2{
                nested: L1{
                    val: 77
                }
            }
        };
    }
}