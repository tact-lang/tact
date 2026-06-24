struct Zero {
    x: Int = 0;
}

struct Ten {
    zero: Zero;
    one: Zero;
    two: Zero;
    three: Zero;
    four: Zero;
    five: Zero;
    six: Zero;
    seven: Zero;
    eight: Zero;
    nine: Zero;
}

contract NestedLots {
    v: Ten = Ten{
        zero:Zero{}, one:Zero{}, two:Zero{}, three:Zero{}, four:Zero{},
        five:Zero{}, six:Zero{}, seven:Zero{}, eight:Zero{}, nine:Zero{}
    };
}