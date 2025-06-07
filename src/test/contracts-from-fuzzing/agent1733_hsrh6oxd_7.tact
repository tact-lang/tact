struct Banana {
    yellow: Bool;
    size: Int;
}

struct Apple {
    red: Bool;
    size: Int;
}

struct FruitBasket {
    banana: Banana;
    apple: Apple;
}

contract TestContract {
    fruits: FruitBasket;

    init() {
        self.fruits = FruitBasket{
            banana: Banana{ yellow: true, size: 7 },
            apple: Apple{ red: true, size: 5 }
        };
    }
}