struct Wrap {
    inner: Int?;
}

contract OptInStructTest {
    field: Wrap?;

    init() {
        self.field = Wrap{ inner:null };
    }
}
