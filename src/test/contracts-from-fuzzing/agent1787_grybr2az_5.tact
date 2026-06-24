struct DefaultsNested {
    opt: Int?;                      // no explicit default, should be null
    flag: Bool = true;             // default value true
    inner: Inner;
}

struct Inner {
    count: Int = 42;               // default value
    message: String = "hello";    // default value
}

contract NestedDefaultsTest {
    data: DefaultsNested;

    init() {
        self.data = DefaultsNested{
            inner: Inner{},
        };
    }
}