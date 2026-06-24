struct S1 { x: Int = 1; }
struct S2 { x: S1 = S1{}; }
struct S3 { x: S2 = S2{}; }
struct S4 { x: S3 = S3{}; }
struct S5 { x: S4 = S4{}; }
struct S6 { x: S5 = S5{}; }
struct S7 { x: S6 = S6{}; }

contract Deep7 {
    data: S7 = S7{};

    init() {
        self.data = S7{};
    }
}