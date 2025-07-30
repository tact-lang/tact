// Test optional struct inside another optional struct
struct Detail {
    x: Int;
    y: Int;
}

struct Wrapper {
    item: Detail?;
}

struct OuterWrapper {
    wrap: Wrapper?;
}

contract Test {
    data: OuterWrapper;

    init() {
        self.data = OuterWrapper{
            wrap: Wrapper{
                item: null
            }
        };
    }
}
