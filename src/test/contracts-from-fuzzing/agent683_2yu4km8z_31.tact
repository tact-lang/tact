struct Combined {
    s: String;
    o: Int?;
    b: Bool;
    a: Address;
}

contract ComboContract {
    val: Combined;

    init() {
        self.val = Combined{
            s: "hello",
            o: null,
            b: true,
            a: myAddress()
        };
    }
}