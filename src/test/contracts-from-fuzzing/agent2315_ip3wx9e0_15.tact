struct DeepOpt {
    x: Int?;
    y: Bool?;
    s: String?;
}

struct Wrapper {
    inner: DeepOpt?;
}

contract NestedOptionalStructField {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: DeepOpt{
                x: null,
                y: null,
                s: null
            }
        };
    }
}