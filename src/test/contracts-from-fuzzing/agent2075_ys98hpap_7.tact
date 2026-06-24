struct DefaultOpt {
    name: String = "Anon";
    age: Int?;
}

contract DefaultOptional {
    info: DefaultOpt;

    init() {
        self.info = DefaultOpt{
            age: 42,
        };
    }
}