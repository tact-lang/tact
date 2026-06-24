struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    text: String;
    sub: S1;
}

contract TestContract {
    info: S2;

    init() {
        self.info = S2{
            text: "hello",
            sub: S1{x: 111, y: true}
        };
    }

    receive() {}
}