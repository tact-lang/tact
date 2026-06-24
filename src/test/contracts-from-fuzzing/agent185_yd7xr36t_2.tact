struct ManyOptionals {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Cell?;
    opt5: Slice?;
    opt6: Address?;
}

contract OptionTest {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            opt1: null,
            opt2: null,
            opt3: true,
            opt4: null,
            opt5: null,
            opt6: null
        };
    }
}
