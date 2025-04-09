struct Str1 {
    s: String;
}

struct Str2 {
    s: String;
}

struct OptionalStrings {
    s1: Str1?;
    s2: Str2?;
}

contract StringsTest {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{ s1: null, s2: null };
    }
}