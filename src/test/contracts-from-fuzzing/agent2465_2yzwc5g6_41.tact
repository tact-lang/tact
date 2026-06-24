// Large struct with optional mix and deep nesting, nested optionals on path
struct Mid1 {
    a: Int;
    s: String?;
}

struct Mid2 {
    m: Mid1?;
    flag: Bool;
}

struct Container {
    inner: Mid2?;
}

contract DeepStructTest {
    val: Container;
    init() {
        self.val = Container{
            inner: Mid2{
                m: null,
                flag: true
            }
        };
    }
}