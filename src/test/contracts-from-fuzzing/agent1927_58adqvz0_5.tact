struct NestedOptionals {
    inner: Int?;
    flag: Bool?;
}

struct Holder {
    data: NestedOptionals?;
}

contract OptionalNestedStructTest {
    val: Holder;
    
    init() {
        self.val = Holder{ data: null };
    }
}