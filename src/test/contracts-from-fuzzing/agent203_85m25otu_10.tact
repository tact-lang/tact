struct LongStruct {
    one: Int;
    two: Int;
    three: Int;
    four: Int;
    five: Int;
    six: Int;
    seven: Int;
    eight: Int;
    nine: Int;
    ten: Int;
    eleven: Int;
    twelve: Int;
    thirteen: Int;
    fourteen: Int;
    fifteen: Int;
    sixteen: Int;
    seventeen: Int;
    eighteen: Int;
    nineteen: Int;
    twenty: Int;
}

contract TestContract {
    big: LongStruct;

    init() {
        self.big = LongStruct{
            one: 1,
            two: 2,
            three: 3,
            four: 4,
            five: 5,
            six: 6,
            seven: 7,
            eight: 8,
            nine: 9,
            ten: 10,
            eleven: 11,
            twelve: 12,
            thirteen: 13,
            fourteen: 14,
            fifteen: 15,
            sixteen: 16,
            seventeen: 17,
            eighteen: 18,
            nineteen: 19,
            twenty: 20,
        };
    }
}