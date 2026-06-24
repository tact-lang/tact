struct Nested1 {
    a: Int;
    b: String;
}

contract TestContract {
    data: Nested1;
    init() {
        self.data = Nested1{
            a: 1,
            b: "hello"
        };
    }
}