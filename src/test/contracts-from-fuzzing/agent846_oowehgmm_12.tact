struct S4 { x: Int?; y: Bool?; }
struct S3 { next: S4?; z: Int; }
struct S2 { s3: S3?; b: Bool; }
struct S1 { s2: S2?; addr: Address; }

contract Test {
    val: S1;

    init() {
        self.val = S1{
            s2: S2{
                s3: S3{ next: S4{ x: null, y: true }, z: 11 },
                b: false
            },
            addr: myAddress()
        };
    }
}