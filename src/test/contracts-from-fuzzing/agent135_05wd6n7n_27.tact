struct SOpt {
    val: Int?;
}

contract NullInitTest {
    prop: SOpt;

    init() {
        self.prop = SOpt{
            val: null
        };
    }
}
