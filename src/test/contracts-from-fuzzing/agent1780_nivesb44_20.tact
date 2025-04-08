struct ManyOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
}

contract OptCombo {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{ a:null, b:null, c:null, d:null, e:null };
    }
}