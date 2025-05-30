struct Mix {
    a: Int?;
    b: Bool?;
    c: Address;
}

contract TestContract {
    fld: Mix;

    init() {
        self.fld = Mix{
            a: null,
            b: true,
            c: myAddress(),
        };
    }
}