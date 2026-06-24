struct ManyOptionals {
    first: Int?;
    second: Bool?;
    third: Address?;
    fourth: Cell?;
    fifth: String?;
}

contract MultiOptionals {
    f: ManyOptionals;

    init() {
        self.f = ManyOptionals{
            first: null,
            second: null,
            third: null,
            fourth: null,
            fifth: null,
        };
    }
}