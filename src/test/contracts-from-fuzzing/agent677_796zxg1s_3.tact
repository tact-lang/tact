struct Inner { val: Int; }

contract OptTest {
    optField: Inner?;

    init() {
        self.optField = null;
    }
}