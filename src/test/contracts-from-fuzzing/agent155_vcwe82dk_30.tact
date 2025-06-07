message(123) UserMsg {
    note: String = "hi";
}

struct OptionalContainer {
    a: Int?;
    b: Address?;
    c: String?;
    d: Bool?;
    m: UserMsg?;
}

contract TestContract {
    cont: OptionalContainer = OptionalContainer{
        a: null,
        b: null,
        c: null,
        d: null,
        m: null
    };

    init() {
        self.cont = OptionalContainer{
            a: null,
            b: null,
            c: null,
            d: null,
            m: null
        };
    }
}