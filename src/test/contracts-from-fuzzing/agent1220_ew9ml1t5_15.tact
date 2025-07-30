struct SBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract ManyBools {
    data: SBool;

    init() {
        self.data = SBool{ a:true, b:false, c:true, d:false };
    }
}