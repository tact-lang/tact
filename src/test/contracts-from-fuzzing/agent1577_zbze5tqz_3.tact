struct Nested3 {
    x: Int?;
    y: String;
}

contract TestContract {
    data: Nested3;
    init() {
        self.data = Nested3{
            x: null,
            y: "hello"
        };
    }
}