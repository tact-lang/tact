struct OptionalDeep {
    inner: Int?;
    s: String?;
    b: Bool?;
}

struct Container {
    nested: OptionalDeep?;
    flag: Bool;
}

contract TestContract {
    container: Container;

    init() {
        self.container = Container{
            nested: null,
            flag: true,
        };
    }
}