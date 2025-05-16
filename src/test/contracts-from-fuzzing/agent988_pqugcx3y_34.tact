struct DuplicateNames {
    x: Int;
    y: Int;
}

contract DupNameTest {
    a: DuplicateNames;
    b: DuplicateNames;

    init() {
        self.a = DuplicateNames{ x:1, y:2 };
        self.b = DuplicateNames{ x:3, y:4 };
    }
}