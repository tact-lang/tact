struct ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Cell?;
    opt6: Slice?;
}

contract TestContract {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{
            opt1: 1,
            opt2: true,
            opt3: "str",
            opt4: null,
            opt5: null,
            opt6: null,
        };
    }
}