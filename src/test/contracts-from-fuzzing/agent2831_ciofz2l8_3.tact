struct A {
    x: Int;
    y: Int?;
    z: Bool;
    txt: String;
}

contract MixedStructFields {
    val: A;

    init() {
        self.val = A{
            x: 1,
            y: null,
            z: true,
            txt: "hi"
        };
    }
}
