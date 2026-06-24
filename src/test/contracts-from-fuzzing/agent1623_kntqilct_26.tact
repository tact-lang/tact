struct SDefaultOpt {
    a: Int?;
    b: Bool = true;
}

contract MixDefaultOptional {
    val: SDefaultOpt;
    init() {
        self.val = SDefaultOpt{
            a: 555,
        };
    }
}