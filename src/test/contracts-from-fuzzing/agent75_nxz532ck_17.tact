struct Weird {
    opt1: Int?;
    regular: Int;
    opt2: Bool?;
}

contract Test {
    weird: Weird;

    init() {
        self.weird = Weird{ opt1: null, regular: 5, opt2: null };
    }
}