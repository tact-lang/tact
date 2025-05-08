struct RecursiveDepth1 {
    child: RecursiveDepth2?;
}

struct RecursiveDepth2 {
    child: RecursiveDepth3?;
}

struct RecursiveDepth3 {
    value: Int?;
}

contract OptionalChainTest {
    root: RecursiveDepth1;

    init() {
        self.root = RecursiveDepth1{
            child: RecursiveDepth2{
                child: RecursiveDepth3{value: 42}
            }
        };
    }
}
