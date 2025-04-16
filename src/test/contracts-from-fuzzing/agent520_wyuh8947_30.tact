// optional struct with defaulted optional primitive fields
struct AddressOpt {
    street: String? = null;
    zip: Int? = null;
}

contract OptionalStructDeep {
    addr: AddressOpt?;
    init() {
        self.addr = null;
    }
}