struct SubSub {
    flag: Bool?;
    label: String = "";
}

struct Sub {
    amount: Int = 0;
    nested: SubSub;
}

struct Root {
    name: String;
    inner: Sub;
}

contract NestedComplex {
    data: Root;

    init() {
        self.data = Root{
            name: "hi",
            inner: Sub{
                amount: 123,
                nested: SubSub{
                    flag: null,
                    label: "LBL"
                }
            }
        };
    }
}