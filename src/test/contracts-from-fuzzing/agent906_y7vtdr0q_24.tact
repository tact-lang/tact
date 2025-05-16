struct Combined {
    a: Int;
    b: Bool?;
    c: String;
}

contract ComboState {
    val: Combined;

    init() {
        self.val = Combined{ a:42, b:null, c:"combo" };
    }
}