struct W {
    s: String?;
}

contract OptStrStruct {
    val: W;
    init() {
        self.val = W{s: null};
    }
}