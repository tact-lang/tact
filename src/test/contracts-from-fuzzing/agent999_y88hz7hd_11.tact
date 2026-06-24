struct InnerMost { val: Int }

struct MidLevel { first: InnerMost; second: InnerMost }

struct TopLevel { left: MidLevel; right: MidLevel }

contract WideNestedTest {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            left: MidLevel{ first: InnerMost{ val: 1 }, second: InnerMost{ val: 2 } },
            right: MidLevel{ first: InnerMost{ val: 3 }, second: InnerMost{ val: 4 } }
        };
    }
}