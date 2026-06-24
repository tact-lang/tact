struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
}

contract MixedFields {
    mt: ManyTypes;

    init() {
        self.mt = ManyTypes{ a:1, b:true, c:"text" };
    }
}
