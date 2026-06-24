struct ManyOptionals {
    opt1: Int?;
    opt2: Int?;
    opt3: Bool?;
    opt4: String?;
    opt5: Cell?;
}

contract TestContract {
    v: ManyOptionals;

    init() {
        self.v = ManyOptionals{ opt1: null, opt2: null, opt3: null, opt4: null, opt5: null };
    }
}
