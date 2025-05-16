struct OptionalStruct {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
}

contract OptionalStructContract {
    optField: OptionalStruct = OptionalStruct{
        a: null,
        b: null,
        s: null,
        addr: null
    };

    init() {
        self.optField = OptionalStruct{
            a: 5,
            b: true,
            s: "filled",
            addr: myAddress()
        };
    }

    receive() {
        let x = self.optField.a;
        let _ = x != null ? x : 0;
    }
}