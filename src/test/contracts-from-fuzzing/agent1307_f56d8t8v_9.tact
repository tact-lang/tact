struct ManyOptional {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Slice?;
    o6: Address?;
}

contract ManyOptionals {
    oo: ManyOptional;

    init() {
        self.oo = ManyOptional{
            o1: 1,
            o2: null,
            o3: null,
            o4: emptyCell(),
            o5: null,
            o6: myAddress()
        };
    }
}