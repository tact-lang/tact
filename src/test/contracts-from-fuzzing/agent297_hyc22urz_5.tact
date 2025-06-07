struct DeepOptional {
    inner: Int?;
}

struct Wrapper {
    value: DeepOptional?;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{ value: null };
    }
}