struct Defaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "def";
    d: Int?; // null default implied
}

contract TestContract {
    val: Defaults;

    init() {
        self.val = Defaults{
            a: 7,
            b: false,
            c: "changed",
            d: null,
        };
    }
}