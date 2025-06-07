struct Nested {
    val: Int = 5;
    flag: Bool = false;
}

struct MixedDefault {
    x: Int?;
    y: Int = 10;
    b: Bool?;
    str: String = "abc";
    nest: Nested;
}

contract TestContract {
    md: MixedDefault;

    init() {
        self.md = MixedDefault{
            x: null,
            b: true,
            nest: Nested{}
        };
    }
}