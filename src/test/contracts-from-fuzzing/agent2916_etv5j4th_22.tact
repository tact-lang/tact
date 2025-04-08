struct LargeNested {
    s1: String;
    s2: String;
    s3: String;
    n: NestedGroup;
}

struct NestedGroup {
    x: Int;
    y: Int;
    z: Int;
    innerBool: Bool;
    innerStr: String;
}

contract LargeNestedContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            s1: "one",
            s2: "two",
            s3: "three",
            n: NestedGroup{
                x: 1,
                y: 2,
                z: 3,
                innerBool: true,
                innerStr: "str"
            }
        };
    }
}