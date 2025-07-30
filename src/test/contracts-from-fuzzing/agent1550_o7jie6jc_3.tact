struct ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract ManyOptionalsContract {
    o: ManyOptionals;
    init() {
        self.o = ManyOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
        };
    }
}