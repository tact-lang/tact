struct Container {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptContract {
    x: Container;
    init() {
        self.x = Container{
            a: null,
            b: true,
            c: null,
        };
    }
    receive() {
        self.x = Container{
            a: 123,
            b: null,
            c: "ok",
        };
    }
}