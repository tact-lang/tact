struct Inner {
    addr: Address;
    s: String?;
}

contract OptionalStringField {
    info: Inner;
    init() {
        self.info = Inner{ addr: myAddress(), s:null };
    }
}
