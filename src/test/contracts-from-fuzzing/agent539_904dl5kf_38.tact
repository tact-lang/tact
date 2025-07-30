struct OptionalAnnotated {
    a: Int? as uint32;
}

contract TestContract {
    oa: OptionalAnnotated;
    init() {
        self.oa = OptionalAnnotated{
            a: null
        };
    }
}