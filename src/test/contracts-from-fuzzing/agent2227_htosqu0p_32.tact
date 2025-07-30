struct OnlyBool {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract ManyBools {
    flags: OnlyBool;

    init() {
        self.flags = OnlyBool{ a:true, b:false, c:true };
    }
}