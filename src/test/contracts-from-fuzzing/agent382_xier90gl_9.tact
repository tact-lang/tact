struct Data {
    a: Int? = null;
    b: Bool?;
    c: String? = null;
    d: Address?;
}

contract TestContract {
    s: Data;

    init() {
        self.s = Data{
            a: 5,
            b: null,
            c: "y",
            d: null
        };
    }

    receive() {}
}