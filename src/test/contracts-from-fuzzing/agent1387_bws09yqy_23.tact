struct InnerDefaultOpt {
    a: Int?;
    b: Bool = false;
}

contract OptDefaults {
    val: InnerDefaultOpt;

    init() {
        self.val = InnerDefaultOpt{
            a: 123,
            b: true
        };
    }
}