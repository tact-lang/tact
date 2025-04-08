struct S1 {
    name: String;
    v: Int;
}

struct S2 {
    strItem: S1;
    number: Int;
}

struct S3 {
    sub: S2;
    label: String;
}

contract DeepWithStrings {
    dws: S3;

    init() {
        self.dws = S3{
            sub: S2{
                strItem: S1{ name: "xy", v: 7 }, number: 14
            },
            label: "main"
        };
    }
}