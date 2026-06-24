struct Defaults {
    a: Int = 10;
    b: String = "abc";
    c: Bool = true;
}

struct MixTypes {
    i: Int; b: Bool; s: String; c: Cell; addr: Address;
}

struct Deep {
    first: Int;
    second: Defaults;
    third: MixTypes;
}

contract MultiStructs {
    val: Deep;

    init() {
        self.val = Deep{
            first: 1,
            second: Defaults{},
            third: MixTypes{
                i: 1,
                b: true,
                s: "abc",
                c: emptyCell(),
                addr: myAddress(),
            },
        };
    }
}