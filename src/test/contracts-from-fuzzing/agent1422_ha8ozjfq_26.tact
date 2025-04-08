struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
}

contract CombineOpt {
    val: Mix;

    init() {
        self.val = Mix{
            a:10,
            b:null,
            c:"hi",
            d:null,
            e:emptyCell(),
        };
    }
}