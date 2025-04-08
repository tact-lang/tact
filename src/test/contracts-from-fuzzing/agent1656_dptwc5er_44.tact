struct OptInnerS {
    x: Int?; 
}

struct OptTestOuter {
    inner: OptInnerS?;
}

contract NilOuterTest {
    data: OptTestOuter;

    init() {
        self.data = OptTestOuter{
            inner: null
        };
    }
}
