struct ManyOptionals {
    one: Int?;
    two: Int?;
    three: Int?;
    four: Int?;
    five: Int?;
}

contract ManyOpts {
    s: ManyOptionals?;

    init() {
        self.s = ManyOptionals{
            one:1, two:2, three:3, four:4, five:5
        };
    }
}