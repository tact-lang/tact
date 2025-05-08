struct Compose1 {
    a: Int;
    b: Compose2;
}

struct Compose2 {
    x: Bool;
    y: Compose3;
}

struct Compose3 {
    m: String;
}

contract ComposeTest {
    data: Compose1;

    init() {
        self.data = Compose1{
            a: 8,
            b: Compose2{
                x: true,
                y: Compose3{
                    m: "hello"
                }
            }
        };
    }
}