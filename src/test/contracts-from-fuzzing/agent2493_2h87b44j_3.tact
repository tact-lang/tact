struct OptionalFields {
    val: Int?;
    str: String?;
    address: Address?;
}

contract TestContract {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            val: null,
            str: null,
            address: null
        };
    }
}