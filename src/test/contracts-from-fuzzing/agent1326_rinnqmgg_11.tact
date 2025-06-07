struct Data {
    x: Int = 5;
}

contract ImplicitNullInit {
    d: Data?;

    init() {
        self.d = Data{ x: 123 };
    }

    receive() {
        let _ = self.d;
    }
}