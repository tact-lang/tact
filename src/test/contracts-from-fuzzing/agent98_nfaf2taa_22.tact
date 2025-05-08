struct StringLevels {
    a1: String;
    a2: String?;
    a3: String;
    a4: String?;
}

contract StringLevelsTest {
    data: StringLevels;

    init() {
        self.data = StringLevels{
            a1: "x", a2: null, a3: "y", a4: "hello"
        };
    }
}