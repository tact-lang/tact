struct DefaultAndInit {
    x: Int = 5;
    y: Int;
}

contract DefaultInitTest {
    data: DefaultAndInit;

    init() {
        self.data = DefaultAndInit{
            y: 10
        };
    }
}