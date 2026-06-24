struct OptionalLevel {
    title: String;
    payload: Int?;
}

contract ComplexOptionals {
    wrapper: OptionalLevel?;

    init() {
        self.wrapper = OptionalLevel{
            title: "sample",
            payload: null
        };
    }
}
