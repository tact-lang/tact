struct SingleFieldOpt {
    opt: Int?;
}

contract SingleOptionalTest {
    data: SingleFieldOpt;

    init() {
        self.data = SingleFieldOpt{ opt: null };
    }
}