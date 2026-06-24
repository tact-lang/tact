struct DefaultOpt {
    x: Int? = null;
    y: Bool? = null;
}

contract DefaultOptionStruct {
    d: DefaultOpt;

    init() {
        self.d = DefaultOpt{
            x: 5,
            y: true
        };
    }
}