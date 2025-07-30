struct Inside {
    n: Int;
}

contract DefaultsInnerStruct {
    val: Inside = Inside{n:10};
    init() {
        self.val = Inside{n:11};
    }
}