struct Compose1 {
    a: Int;
    b: Bool?;
}

struct Compose2 {
    x: Compose1;
    y: Bool;
    z: Int;
}

contract ComposeTest {
    value: Compose2;

    init() {
        self.value = Compose2{
            x: Compose1{ a: 17, b: null },
            y: false,
            z: 123
        };
    }
}