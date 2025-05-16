struct OptionalHolder {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract Test {
    data: OptionalHolder;

    init() {
        self.data = OptionalHolder{
            a: null,
            b: true,
            c: null,
            d: myAddress(),
        };
    }
}
