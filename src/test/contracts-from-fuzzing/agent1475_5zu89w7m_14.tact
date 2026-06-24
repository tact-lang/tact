struct DeepNested {
    one: String;
    two: Bool;
    three: Int;
    
    four: String;
    five: Bool;
    six: Int;

    seven: String;
    eight: Bool;
    nine: Int;
}

contract ManyDeepInputs {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            one: "one", two: true, three: 3,
            four: "four", five: false, six: 6,
            seven: "seven", eight: true, nine: 9,
        };
    }
}