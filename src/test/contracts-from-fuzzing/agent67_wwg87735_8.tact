struct DeeplyOptional {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Int?;
}

contract TestOptionalInit {
    val: DeeplyOptional;

    init() {
        self.val = DeeplyOptional{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: 42
        };
    }
}
