contract TestContract {
    arr: Arr;

    init() {
        self.arr = Arr{
            first: Item{ val: 1 },
            second: Item{ val: 2 },
            third: Item{ val: 3 }
        };
    }
}

struct Arr {
    first: Item;
    second: Item;
    third: Item;
}

struct Item {
    val: Int;
}