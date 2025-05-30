struct ManyOpts {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Bool?;
    o7: Bool?;
    o8: String?;
    o9: Slice?;
    o10: Cell?;
}

contract ManyOptionals {
    many: ManyOpts;

    init() {
        self.many = ManyOpts{
            o1: 1, o2: null, o3: 3, o4: null, o5: 5, 
            o6: true, o7: null, o8: "hi", o9: emptyCell().asSlice(), o10: emptyCell()
        };
    }
}