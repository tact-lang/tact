struct Nested {
    flag: Bool;
    text: String;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            flag: true,
            text: "hello"
        };
    }
}