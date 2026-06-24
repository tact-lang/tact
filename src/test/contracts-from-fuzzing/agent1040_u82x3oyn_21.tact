struct InlineInit {
    i: Int = 0;
    b: Bool = false;
    s: String = "";
    a: Address;
}

contract InlineDefaultsPartial {
    data: InlineInit;

    init() {
        self.data = InlineInit{
            a: myAddress()
        };
    }
}