struct OptionalNested {
    innerStructOpt: Inner?;
}

struct Inner {
    x: Int;
    name: String;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            innerStructOpt: null
        };
    }
}