struct L2 {
    val: Int?;
}

struct L1 {
    inner: L2?;
}

contract OptInOpt {
    field: L1;

    init() {
        self.field = L1{
            inner: L2{
                val: null
            }
        };
    }
}