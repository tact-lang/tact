struct LongStrings {
    s1: String;
    s2: String;
}

contract LongStrsTest {
    f: LongStrings;
    init() {
        self.f = LongStrings{
            s1: "This is a very very very very long string to test persistence serialization behavior.",
            s2: "Another long piece of text that might push boundaries on storage serialization."
        };
    }
}