struct MixedDefaults {
    a: Int;
    b: Int = 5;
    c: Bool;
    d: Bool = false;
}

contract TestContract {
    md: MixedDefaults;

    init() {
        self.md = MixedDefaults{a: 1, c: true};
    }
    
    receive() {
        let _ = self.md.d;
    }
}