struct OptionalNest {
    innerVal: Int?;
    flag: Bool?;
}

contract TestContract {
    complex: OptionalNest;

    init() {
        self.complex = OptionalNest{
            innerVal: null,
            flag: true
        };
    }
}