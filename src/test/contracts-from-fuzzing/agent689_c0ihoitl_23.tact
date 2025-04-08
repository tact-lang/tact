struct DeepOptField {
    inner: InnerOpt;
}

struct InnerOpt {
    val: Int?;
}

contract DeepOptFieldTest {
    data: DeepOptField;

    init() {
        self.data = DeepOptField{
            inner: InnerOpt{ val: null },
        };
    }
}