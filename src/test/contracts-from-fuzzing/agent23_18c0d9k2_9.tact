struct OptionalIntStruct {
    optInt: Int?;
}

contract OptionalIntInitContract {
    data: OptionalIntStruct;

    init() {
        self.data = OptionalIntStruct{ optInt: null };
    }
}