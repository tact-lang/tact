struct S1 {
    x: Int?;
}

struct S2 {
    y: S1?;
}

contract OptOnOptStructField {
    data: S2;
    init() {
        self.data = S2 {
            y: null
        };
    }
}