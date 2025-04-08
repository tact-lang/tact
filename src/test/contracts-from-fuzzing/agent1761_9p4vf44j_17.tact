struct SerialOptional {
    one: Int?;
    two: Bool?;
    three: String?;
    four: Cell?;
    five: Address?;
}

contract TestContract {
    state: SerialOptional;

    init() {
        self.state = SerialOptional{
            one:null, two:null, three:null, four:null, five:null
        };
    }
}