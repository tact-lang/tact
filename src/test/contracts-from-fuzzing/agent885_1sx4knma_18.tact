struct DefaultAndExplicit {
    x: Int = 5;
    y: Int;
}

contract TestContract {
    comb: DefaultAndExplicit;

    init() {
        self.comb = DefaultAndExplicit{
            y: 10,
        };
    }
}