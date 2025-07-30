// test deeply nested optional struct
struct L3 {
    value: Int?;
}

struct L2 {
    inner: L3?;
}

struct L1 {
    mid: L2?;
}

contract TestNestedOptionals {
    data: L1? = null;

    init() {
        self.data = L1{
            mid: L2{
                inner: L3{value: 123}
            }
        };
    }
}
