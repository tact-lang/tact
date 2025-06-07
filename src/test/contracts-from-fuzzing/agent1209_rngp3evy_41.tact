struct Pak {
    a: Int?;
    b: Int;
}
contract OptAndNonOptFields {
    data: Pak;
    init() {
        self.data = Pak{a: null, b: 5};
    }
}