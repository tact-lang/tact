struct ManyOptionalDeeps {
    a: Inner?;
    b: Inner?;
    c: Inner?;
    d: Inner?;
}

struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract OptDeepsTest {
    val: ManyOptionalDeeps;
    init() {
        self.val = ManyOptionalDeeps{
            a: Inner{foo: 1, bar: null},
            b: null,
            c: Inner{foo: null, bar: true},
            d: null,
        };
    }
}