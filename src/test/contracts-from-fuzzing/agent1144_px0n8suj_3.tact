struct OptionalInner { value: Int?; flag: Bool?; }

contract OptionalStructContract {
    nested: OptionalInner;

    init() {
        self.nested = OptionalInner{ value: null, flag: null };
    }
}