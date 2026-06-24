struct ManyOptions {
    one: Bool?;
    two: Bool?;
    three: Bool?;
    four: Bool?;
    five: Bool?;
    six: Bool?;
}

contract ManyOpts {
    combined: ManyOptions;

    init() {
        self.combined = ManyOptions{
            one:null,two:null,three:null,four:null,five:null,six:null
        };
    }
}