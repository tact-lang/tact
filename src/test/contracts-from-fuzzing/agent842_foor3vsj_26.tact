struct OptInt {
    val: Int?;
}

struct WrapOptInt {
    inner: OptInt;
}

contract WrapOptTest {
    data: WrapOptInt;

    init() {
        self.data = WrapOptInt{
            inner: OptInt{ val: null }
        };
    }

    receive() {
        let _= self.data;
    }
}