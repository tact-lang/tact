struct Combined {
    num: Int;
    flag: Bool;
    text: String;
}

contract MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Combined;

    init() {
        self.a = -1;
        self.b = true;
        self.c = "tact";
        self.d = Combined{
            num:42,
            flag:false,
            text: "hello",
        };
    }
}