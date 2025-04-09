struct ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Cell?;
    opt6: Slice?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null,
        };
    }
}
