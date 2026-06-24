struct OptionalsCombination {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
}

contract OptionalsMixContract {
    data: OptionalsCombination;

    init() {
        self.data = OptionalsCombination{
            a:null, b:null, c:null, d:null,
            e:5, f:true, g:"hi", h:myAddress()
        };
    }
}