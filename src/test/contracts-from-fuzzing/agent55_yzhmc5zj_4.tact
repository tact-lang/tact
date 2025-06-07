struct Wrap1 { inner: Int }
struct Wrap2 { inner: Wrap1 }
struct Wrap3 { inner: Wrap2 }
struct Wrap4 { inner: Wrap3 }

contract DeepWrapTest {
    field: Wrap4;
    init() {
        self.field = Wrap4 {
            inner: Wrap3 {
                inner: Wrap2 {
                    inner: Wrap1 { inner: 42 }
                }
            }
        };
    }
}