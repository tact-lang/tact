struct DefaultInNested {
    nested: Inner;
}

struct Inner {
    flag: Bool = true;
    number: Int = 5;
}

contract NestedDefaultTest {
    data: DefaultInNested;

    init() {
        self.data = DefaultInNested{
            nested: Inner{}
        };
    }
}
