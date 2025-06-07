struct S1 { x: Int = 1; }
struct S2 { y: S1 = S1{}; }
struct S3 { z: S2 = S2{}; }

contract DeepDefaultChain {
    data: S3;

    init() {
        self.data = S3{};
    }
}
