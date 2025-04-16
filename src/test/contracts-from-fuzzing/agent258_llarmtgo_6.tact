struct OptionalStruct {
    x: Int?;
    y: String?;
}

struct Container {
    inner: OptionalStruct?;
}

contract StorageContract {
    data: Container;

    init() {
        self.data = Container{
            inner: null,
        };
    }
}