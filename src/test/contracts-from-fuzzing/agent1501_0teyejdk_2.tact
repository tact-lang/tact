struct NestedInner {
    innerVal: Int;
}

contract NestedStructTest {
    myData: NestedInner;

    init() {
        self.myData = NestedInner{ innerVal: 7 };
    }
}