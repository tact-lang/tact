struct MultipleOptionals {
    opt1: Int?;
    opt2: Int?;
    opt3: Bool?;
    opt4: String?;
}

contract Test {
    val: MultipleOptionals;

    init() {
        self.val = MultipleOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
        };
    }
}