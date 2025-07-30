struct OptionNested {
    inn: Int?;
}

struct OuterOpt {
    inner: OptionNested?;
    val: Bool;
}

contract NestedOptionals {
    myData: OuterOpt;

    init() {
        self.myData = OuterOpt{ inner: null, val: true };
    }
}