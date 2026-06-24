struct Wrapped {
    str: String;
    opt: Bool?;
}

contract OptionalContract {
    f1: Int;
    wrapper: Wrapped?;

    init() {
        self.f1 = 0;
        self.wrapper = Wrapped{
            str: "data",
            opt: true
        };
    }
}
