struct Mixed {
    a: Int = 5;
    b: Bool?;
    c: String = "def";
    d: Int?;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{ b: null, d: 42 };
    }
}