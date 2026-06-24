struct TrailingOptionals {
    first: String;
    o1: Int?;
    o2: Bool?;
}

contract TestContract {
    data: TrailingOptionals;

    init() {
        self.data = TrailingOptionals{
            first: "start",
            o1: 123,
            o2: null
        };
    }
}