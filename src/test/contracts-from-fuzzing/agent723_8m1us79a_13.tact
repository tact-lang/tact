struct Mix {
    a: Int;
    b: Bool;
    c: Address;
    d: String?;
}

contract TestContract {
    val: Mix;

    init() {
        self.val = Mix{
            a: 5,
            b: false,
            c: myAddress(),
            d: null,
        };
    }

    receive() {}
}