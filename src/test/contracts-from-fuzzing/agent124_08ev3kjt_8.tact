struct OptionalInner { val: Int?; }

contract OptionalOfStructTest {
    data: OptionalInner?;
    init() {
        self.data = null;
    }
}