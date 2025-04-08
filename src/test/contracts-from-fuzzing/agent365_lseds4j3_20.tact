struct S {
    a: Int;
    b: Int?;
    c: String;
    d: Bool;
}

contract ManyOptionals {
    sField: S;

    init() {
        self.sField = S{ a: 5, b: null, c: "hey", d: true };
    }
}