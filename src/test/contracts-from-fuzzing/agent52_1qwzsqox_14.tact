struct DefaultOptional {
    x: Int?;
}

contract TestContract {
    data: DefaultOptional;

    init() {
        self.data = DefaultOptional{ x: null };
    }
}
