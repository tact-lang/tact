struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
}

struct OuterWithNestedStrings {
    main: String;
    nested: NestedStrings;
}

contract CompoundString {
    o: OuterWithNestedStrings;

    init() {
        self.o = OuterWithNestedStrings{
            main: "main",
            nested: NestedStrings{
                s1: "s1",
                s2: "s2",
                s3: "s3"
            }
        };
    }
}
