struct ManyOptionals {
    val1: Int?;
    val2: Bool?;
    val3: String?;
    val4: Cell?;
    val5: Slice?;
}

contract OptionalStructTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            val1: null,
            val2: null,
            val3: null,
            val4: null,
            val5: null,
        };
    }
}