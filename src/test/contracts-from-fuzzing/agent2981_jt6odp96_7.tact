struct OptionLevel {
    a: Int?;
    b: Bool?;
    c: Cell?;
}

struct OuterOption {
    nested: OptionLevel?;
    flag: Bool;
}

contract OptionalStructField {
    o: OuterOption;

    init() {
        self.o = OuterOption{
            nested: null,
            flag: true,
        };
    }
}