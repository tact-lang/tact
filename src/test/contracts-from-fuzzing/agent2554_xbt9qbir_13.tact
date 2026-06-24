struct L2 { x: Int = 10; y: Int; }
struct L1 { inner: L2; z: Int = 42; }

contract NestedDefaults {
    s: L1;

    init() {
        self.s = L1{
            inner: L2{
                y: 5
            }
            // omit z, relies on default 42
        };
    }
}