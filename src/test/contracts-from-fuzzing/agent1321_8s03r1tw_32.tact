struct A {
    x: Int;
    y: Int?;
}

contract MissingOptInit {
    data: A;
    init() {
        self.data = A{ x: 5 };
    }
}