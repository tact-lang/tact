struct S1 { val: Int }
struct S2 { inner: S1 }
struct S3 { inner: S2 }
struct S4 { inner: S3 }

contract Deep4 {
    val: S4;

    init() {
        self.val = S4{ inner: S3{ inner: S2{ inner: S1{ val: 77 } } } };
    }
}