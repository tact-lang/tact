struct X {
    s: String;
    y: Int?;
}

contract TestContract {
    x: X;

    init() {
        self.x = X{
            s: "abc",
            y: null
        };
    }
}