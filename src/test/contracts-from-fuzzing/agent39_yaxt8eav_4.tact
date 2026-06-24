struct NestedOptional {
    val: Int?;
    label: String?;
}

struct Wrapper {
    inner: NestedOptional?;
    status: Bool;
}

contract NestedOptionals {
    payload: Wrapper;

    init() {
        self.payload = Wrapper{
            inner: null,
            status: true,
        };
    }
}