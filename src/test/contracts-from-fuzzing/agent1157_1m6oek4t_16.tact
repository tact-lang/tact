struct InnerText { txt: String?; }

contract DeepOptStrTest {
    inner: InnerText?;

    init() {
        self.inner = null;
    }

    receive() {
        let tmp = self.inner;
    }
}