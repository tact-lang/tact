struct DefaultValOpt {
    a: Int = 1;
    b: Int?;
}

contract MixedDefaultOptional {
    data: DefaultValOpt;

    init() {
        self.data = DefaultValOpt{ b: null };
    }
}