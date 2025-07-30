struct InnerLevel {
    flag: Bool;
}

contract OptionalInnerArrayTest {
    first: InnerLevel?;
    second: InnerLevel?;
    third: InnerLevel?;
    fourth: InnerLevel?;

    init() {
        self.first = null;
        self.second = null;
        self.third = null;
        self.fourth = null;
    }
}