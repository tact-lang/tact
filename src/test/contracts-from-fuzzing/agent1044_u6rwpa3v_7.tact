struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
}

contract Defaulted {
    val: Defaults;
    init() {
        self.val = Defaults {};
    }
}