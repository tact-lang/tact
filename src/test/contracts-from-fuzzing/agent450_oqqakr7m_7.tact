struct Nested {
    foo: Int;
    bar: Bool?;
}

struct Combo {
    count: Int;
    inner: Nested;
    label: String?;
}

contract ComboStore {
    val: Combo;
    init() {
        self.val = Combo{count: 1, inner: Nested{foo:42, bar:true}, label:"abc"};
    }
}