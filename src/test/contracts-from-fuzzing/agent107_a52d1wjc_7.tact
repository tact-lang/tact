struct ManyOptional {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Cell?;
}

contract MultiOptStorage {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
        };
    }
}