struct NestedBools {
    flag: Bool;
    inner: NestedBools2;
}

struct NestedBools2 {
    innerFlag: Bool;
}

contract TestNestedBools {
    data: NestedBools;

    init() {
        self.data = NestedBools{
            flag: true,
            inner: NestedBools2{
                innerFlag: false
            }
        };
    }
}
