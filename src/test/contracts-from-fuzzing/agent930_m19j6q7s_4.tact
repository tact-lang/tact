struct Banana {
    yellow: Bool;
    sweet: Bool;
}

struct FruitBasket {
    appleCount: Int;
    bananas: Banana;
    note: String?;
    hasOranges: Bool;
}

contract NestedOptionals {
    contents: FruitBasket;

    init() {
        self.contents = FruitBasket{
            appleCount: 5,
            bananas: Banana{yellow:true, sweet:true},
            note: null,
            hasOranges: false
        };
    }
}