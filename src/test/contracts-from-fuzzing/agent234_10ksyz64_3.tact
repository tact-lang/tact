struct SingleOptional {
    val: Int?;
}

contract OptionalTest {
    data: SingleOptional;

    init() {
        self.data = SingleOptional{ val: null };
    }
}