struct Defaulted {
    x: Int = 1;
    y: Bool = false;
    z: Int?;
}

struct Wrapper {
    inner: Defaulted;
    another: Int;
}

contract TestContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            inner: Defaulted{
                z: null
            },
            another: 10
        };
    }
}