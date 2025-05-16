struct Defaults {
    a: Int = 10;
    b: Int = 20;
    c: Int = 30;
}

contract TestContract {
    data: Defaults;

    init() {
        self.data = Defaults{
            b: 99,
        };
    }
}