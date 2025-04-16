struct Complex {
    x: Int?;
    y: Bool?;
    z: String?;
    flag: Bool;
    number: Int;
    text: String;
}

contract CTest {
    cx: Complex;

    init() {
        self.cx = Complex{
            x: null,
            y: null,
            z: null,
            flag: true,
            number: 100,
            text: "foo"
        };
    }
}