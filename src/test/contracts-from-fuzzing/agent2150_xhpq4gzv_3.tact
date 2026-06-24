struct NestedA {
    b: NestedB;
}

struct NestedB {
    c: NestedC;
}

struct NestedC {
    innerValue: Int;
    optionalFlag: Bool?;
    bigText: String;
}

contract TestContract {
    data: NestedA;

    init() {
        self.data = NestedA{
            b: NestedB{
                c: NestedC{
                    innerValue: 12345,
                    optionalFlag: true,
                    bigText: "deep"
                }
            }
        };
    }
}