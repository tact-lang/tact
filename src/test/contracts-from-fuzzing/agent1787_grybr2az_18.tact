struct MultiLayerOptional {
    i: Int?;
    inner: Inner?;
}

struct Inner {
    j: Int?;
    innermost: Innermost?;
}

struct Innermost {
    k: Int?;
}

contract MultiLayerOptTest {
    data: MultiLayerOptional;

    init() {
        self.data = MultiLayerOptional{
            i: null,
            inner: null
        };
    }
}