struct Nested {
    label: String;
    num: Int;
}

contract DeepList {
    a: Nested;
    b: Nested;
    c: Nested;
    d: Nested;

    init() {
        self.a = Nested{label:"one", num:1};
        self.b = Nested{label:"two", num:2};
        self.c = Nested{label:"three", num:3};
        self.d = Nested{label:"four", num:4};
    }
}