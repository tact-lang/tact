struct ContainsString {
    s: String;
}

struct ContainsBool {
    b: Bool;
}

contract MixWithStruct {
    s: ContainsString;
    b: ContainsBool;

    init() {
        self.s = ContainsString{ s: "x" };
        self.b = ContainsBool{ b: true };
    }
}
