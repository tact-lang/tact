struct InnerMost { a: Int }

struct InnerLevel { inner: InnerMost; b: Int }

struct OuterMost { nested: InnerLevel; x: Int }

contract ThreeLayerNestedTest {
    state: OuterMost;
    init() {
        self.state = OuterMost{
            nested: InnerLevel{
                inner: InnerMost{a: 7},
                b: 8
            },
            x: 9
        };
    }
}