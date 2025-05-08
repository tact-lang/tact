// deeply nested optionals, single layer per struct
struct L1 {
    inner: L2?;
}
struct L2 {
    inner: L3?;
}
struct L3 {
    inner: L4?;
}
struct L4 {
    value: Int?;
}
contract DeepOptionals {
    root: L1;

    init() {
        self.root = L1{
            inner: L2{
                inner: L3{
                    inner: L4{
                        value: null
                    }
                }
            }
        };
    }
}