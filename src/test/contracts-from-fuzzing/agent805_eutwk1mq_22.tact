struct S3 {
    z: Int?;
}

struct S2 {
    y: S3?;
}

struct S1 {
    x: S2?;
}

contract TestContract {
    nest: S1?;

    init() {
        self.nest = null;
    }
}