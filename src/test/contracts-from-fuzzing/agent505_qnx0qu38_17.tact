struct NumStr {
    number: Int;
    word: String;
}

struct HasTwo {
    first: NumStr;
    second: NumStr;
}

contract DoubleStruct {
    pair: HasTwo = HasTwo{
        first: NumStr{ number: 1, word: "one" },
        second: NumStr{ number: 2, word: "two" }
    };

    init() {
        self.pair = HasTwo{ first: NumStr{ number: 3, word: "three" }, second: NumStr{ number:4, word:"four" } };
    }

    receive() {
        self.pair = self.pair;
    }
}