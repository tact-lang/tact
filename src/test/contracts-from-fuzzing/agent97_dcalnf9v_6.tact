struct OptNested {
    foo: Int?;
    bar: Bool?;
}

struct Container {
    nested: OptNested?;
}

contract OptWrap {
    val: Container;
    init() {
        self.val = Container{
            nested: null
        };
    }
}