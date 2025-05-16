struct HasOptional {
    x: Int?;
    y: Bool;
}

contract TestContract {
    data: HasOptional;

    init() {
        self.data = HasOptional{x: null, y: true};
    }
}