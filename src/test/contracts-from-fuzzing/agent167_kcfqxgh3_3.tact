struct Nested {
    flag: Bool = false;
    label: String = "";
}

contract OptStructs {
    foo: Nested?;
    bar: Int?;
    note: String?;

    init() {
        self.foo = Nested{flag: true, label: "yes"};
        self.bar = 100;
        self.note = "hello";
    }
}