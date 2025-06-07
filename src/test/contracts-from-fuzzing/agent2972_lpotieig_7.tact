struct S3 {
    d: Int = 5;
}

struct S2 {
    c: S3 = S3{};
}

struct S1 {
    b: S2 = S2{};
}

contract DeepDefaults {
    val: S1;

    init() {
        self.val = S1{}; // rely on default cascade
    }
}
