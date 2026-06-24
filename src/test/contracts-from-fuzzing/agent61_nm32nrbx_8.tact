struct Defaulted {
    a: Int = 123;
    b: Bool?;
    c: String? = "hello";
}

contract TestContract {
    val: Defaulted;

    init() {
        self.val = Defaulted{
            a: 42,
            b: null,
            c: "world"
        };
    }
}