struct InnerMost {
    flag: Bool;
}

struct MiddleLayer {
    wrapper: InnerMost;
}

struct OuterLayer {
    mid: MiddleLayer;
}

contract DeepBoolTest {
    container: OuterLayer;

    init() {
        self.container = OuterLayer{
            mid: MiddleLayer{
                wrapper: InnerMost{ flag: true }
            }
        };
    }
}