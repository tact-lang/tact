struct Crazy {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: Bool?;
    f: String;
    g: Int;
}

contract CrazyFieldsContract {
    craz: Crazy;

    init() {
        self.craz = Crazy{
            a: null, b: true, c: null, d: myAddress(),
            e: null, f: "hi", g: 5
        };
    }
}