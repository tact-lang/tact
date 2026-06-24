struct OptionalHolder {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptFields {
    val: OptionalHolder;

    init() {
        self.val = OptionalHolder{
            a: null,
            b: true,
            c: null
        };
    }
}