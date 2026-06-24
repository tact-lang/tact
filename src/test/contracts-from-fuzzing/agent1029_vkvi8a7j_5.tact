struct LargeStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    data: LargeStrings;
    init() {
        self.data = LargeStrings{
            s1: "A very large string indeed...",
            s2: "Another extremely verbose text blob...",
            s3: "Yet another lengthy description here"
        };
    }
}