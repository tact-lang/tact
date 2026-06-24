struct OptionalAfterDefault {
    a: Int = 1;
    b: Int?;
}

contract TestContract {
    s: OptionalAfterDefault;

    init() {
        self.s = OptionalAfterDefault{
            b: null
        };
    }
}