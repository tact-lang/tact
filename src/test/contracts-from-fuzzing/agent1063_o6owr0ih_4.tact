struct OptionalInner { value: Int?; flag: Bool?; }

contract OptionalStructs {
    innerOpt: OptionalInner;

    init() {
        self.innerOpt = OptionalInner{ value: null, flag: null };
    }
}