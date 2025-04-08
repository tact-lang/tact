struct MultiOptional {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract ManyOptionals {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            one: 1,
            two: null,
            three: null
        };
    }

    receive() {
        let _ = self.data;
    }
}