struct OptionalNested {
    foo: Int;
    bar: Int?;
}

struct ContainOpt {
    inner: OptionalNested?;
}

contract OptInsideOpt {
    data: ContainOpt;

    init() {
        self.data = ContainOpt{
            inner: OptionalNested{ foo:5, bar:null }
        };
    }
}