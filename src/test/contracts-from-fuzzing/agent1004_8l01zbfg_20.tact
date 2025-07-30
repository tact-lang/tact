// deeply nested optionals with mixed primitive types
struct S1 { x: Int?; y: Bool?; }
struct S2 { inner: S1?; z: String?; }
struct S3 { nested: S2?; addr: Address?; }

contract TestContract {
    data: S3?;
    init() {
        self.data = S3 {
            nested: S2 {
                inner: S1 {
                    x: 42,
                    y: null
                },
                z: "foo"
            },
            addr: myAddress()
        };
    }
}