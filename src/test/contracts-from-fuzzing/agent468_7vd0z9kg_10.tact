// Contract with primitive + nested struct array (array simulated via many numbered fields)
struct ArrItem {
    idx: Int;
    val: Int;
}

contract ArrayLike {
    a0: ArrItem;
    a1: ArrItem;
    a2: ArrItem;
    total: Int;

    init() {
        self.a0 = ArrItem{idx:0, val:10};
        self.a1 = ArrItem{idx:1, val:20};
        self.a2 = ArrItem{idx:2, val:30};
        self.total = 60;
    }
}