struct LargeOptStrings {
    a: String?;
    b: String?;
    c: String;
}

contract LargeStringsNulls {
    data: LargeOptStrings;

    init() {
        self.data = LargeOptStrings{
            a: null,
            b: "This is a significantly longer string to test serialization",
            c: "Non-optional string here"
        };
    }
}
