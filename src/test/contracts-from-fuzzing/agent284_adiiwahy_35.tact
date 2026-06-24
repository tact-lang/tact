struct ExplicitOrdered {
    first: Int;
    second: Int;
    third: Int;
}

contract OrderedConstruct {
    data: ExplicitOrdered;
    init() {
        self.data = ExplicitOrdered{
            second: 20,
            third: 30,
            first: 10
        };
    }
}