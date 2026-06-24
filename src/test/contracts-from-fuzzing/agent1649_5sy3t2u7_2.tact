struct DeepNest {
    inner: Int?;
}

struct Middle {
    nest: DeepNest?;
}

contract DeepOptionalTest {
    field: Middle;

    init() {
        self.field = Middle{
            nest: null
        };
    }
}