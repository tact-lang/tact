struct Combo {
    a: Int = 1;
    b: Bool?;
    c: String = "x";
    d: Address?;
}

contract TestContract {
    val: Combo;

    init() {
        self.val = Combo{
            b: null,
            d: null,
        };
    }

    receive() {}
}