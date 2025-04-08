struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Cell?;
    o4: String?;
    o5: Int?;
    o6: Bool?;
    o7: Cell?;
    o8: String?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1: null, o2: null, o3: null, o4: null,
            o5: 5, o6: true, o7: emptyCell(), o8: "text"
        };
    }
}
