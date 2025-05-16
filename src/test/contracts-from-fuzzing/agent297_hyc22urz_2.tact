struct OptionalNested {
    inner: Int?;
}

struct Outer {
    nested: OptionalNested;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: OptionalNested{ inner: null },
            flag: true
        };
    }
}