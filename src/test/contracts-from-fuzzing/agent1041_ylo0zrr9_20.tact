struct NestedDefaulted {
    inner: InnerDefaulted;
}

struct InnerDefaulted {
    val1: Int = 0;
    val2: Int? = null;
    flag: Bool = false;
    txt: String = "";
}

contract DefaultedNested {
    data: NestedDefaulted;

    init() {
        self.data = NestedDefaulted{
            inner: InnerDefaulted{}
        };
    }
}
