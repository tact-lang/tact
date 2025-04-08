struct NestedDefaults { a: Int = 5; b: Bool = false; c: String = "hi"; }

struct UseDefaults {
    inner: NestedDefaults;
    val: Int = 42;
}

contract Test17 {
    data: UseDefaults;

    init() {
        self.data = UseDefaults{
            inner: NestedDefaults{},
            val: 123
        };
    }
}