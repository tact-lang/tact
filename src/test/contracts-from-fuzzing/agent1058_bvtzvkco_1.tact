struct Nested {
    alpha: Int?;
    beta: Bool?;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{alpha: null, beta: true};
    }
}