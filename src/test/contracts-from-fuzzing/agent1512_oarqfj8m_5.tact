struct OptionalInner { foo: Int?; bar: Bool?; }

contract TestContract {
    data: OptionalInner?;

    init() {
        self.data = null;
    }
}