struct OuterOption {
    nested: InnerOption?;
}

struct InnerOption {
    x: Int?;
    y: Bool?;
}

contract NestedOptionsTest {
    state: OuterOption;
    init() {
        self.state = OuterOption{
            nested: InnerOption{
                x: null,
                y: true
            }
        };
    }
}