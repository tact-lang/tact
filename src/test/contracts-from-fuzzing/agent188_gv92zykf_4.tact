struct Wrapper {
    nested: Inner;
}

struct Inner {
    field: Int;
}

contract DeepContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: Inner{
                field: 123
            }
        };
    }
}
