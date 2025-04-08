struct OptInner { a: Int?; flag: Bool; }

contract OptionalStructTest {
    data: OptInner;

    init() {
        self.data = OptInner{ a: null, flag: false };
    }
}
