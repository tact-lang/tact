struct L {
    a: Int;
}
struct R {
    b: String?;
}

contract CrossStruct {
    left: L;
    right: R;

    init() {
        self.left = L{a:5};
        self.right = R{b:null};
    }
}