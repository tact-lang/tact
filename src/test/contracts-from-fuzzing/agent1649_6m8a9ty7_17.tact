struct Mixed {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int;
}

contract TestContract {
    val: Mixed;

    init() {
        self.val = Mixed{
            d: 42,
            // omit a,b,c -> defaults apply
        };
    }
}