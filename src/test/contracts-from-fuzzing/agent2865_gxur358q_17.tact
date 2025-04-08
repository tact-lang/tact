struct Complex {
    i: Int;
    b: Bool;
    s: String;
    opt: Int?;
    text: String;
    flag: Bool;
}

contract ManyStructFields {
    val: Complex;

    init() {
        self.val = Complex{
            i: 1,
            b: true,
            s: "hello",
            opt: null,
            text: "world",
            flag: false
        };
    }
}