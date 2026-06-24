struct OptInner { value: Int? }
struct Out { inner: OptInner }

contract OptionalInner {
    storage: Out;

    init() {
        self.storage = Out{ inner: OptInner{ value: null } };
    }
}