// Fuzz with mix of optional, default and explicit init persistent fields
contract Mix {
    a: Int? = null;
    b: Bool = false;
    c: String?;
    d: Address;

    init() {
        self.c = null;
        self.d = myAddress();
    }
}
