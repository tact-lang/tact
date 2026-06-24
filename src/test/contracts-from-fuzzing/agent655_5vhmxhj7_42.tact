struct OnlyOptional {
    x: Int?;
}

contract TestContract {
    data: OnlyOptional;

    init() {
        self.data = OnlyOptional{ x: null };
    }
}
