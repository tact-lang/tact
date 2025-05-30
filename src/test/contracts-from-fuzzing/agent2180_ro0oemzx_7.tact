struct OptInner {
    value: Int?;
}

contract OptDefaultTest {
    info: OptInner;

    init() {
        self.info = OptInner{
            value: null
        };
    }
}