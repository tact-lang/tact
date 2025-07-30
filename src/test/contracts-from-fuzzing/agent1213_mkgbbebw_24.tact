struct NestedOptInt {
    inner: Int?;
}

contract NestedOptIntTest {
    s: NestedOptInt;
    
    init() {
        self.s = NestedOptInt{ inner: null };
    }
}