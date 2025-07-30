struct DeeplyOptional {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
}

contract MultiOptStructTest {
    d: DeeplyOptional?;

    init() {
        self.d = null;
    }
}