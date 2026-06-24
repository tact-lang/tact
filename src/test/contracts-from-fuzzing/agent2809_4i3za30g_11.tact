struct S1 {
    x: Int = 1;
}
struct S2 {
    y: S1;
}
struct S3 {
    z: S2;
}
struct S4 {
    w: S3;
}

contract DeepStructField {
    data: S4;

    init() {
        self.data = S4{
            w: S3{
                z: S2{
                    y: S1{ x: 999 }
                }
            }
        };
    }
}