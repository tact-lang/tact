struct OptInner {
    val: Int?;
}

struct OptContainer {
    inner: OptInner?;
}

contract DoubleOptTest {
    data: OptContainer?;

    init() {
        self.data = OptContainer{
            inner: OptInner{
                val: null
            }
        };
    }
}