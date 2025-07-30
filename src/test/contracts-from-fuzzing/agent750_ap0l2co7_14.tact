struct Mixed {
    a: Int;
    b: Bool;
    c: String;
}

contract MixedTypes {
    mix: Mixed;
    init() {
        self.mix = Mixed{a: 5, b: false, c: "hi"};
    }
}