// Struct with multiple optional strings
struct OptStrings {
    s1: String?;
    s2: String?;
    s3: String?;
}

contract ManyOptStr {
    data: OptStrings;
    init() {
        self.data = OptStrings{ s1: "hi", s2: null, s3: null };
    }
    receive() {
        if (self.data.s1 != null) {
            self.data.s3 = "new";
        }
    }
}