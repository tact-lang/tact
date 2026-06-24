struct Inner {
    val: Int;
}

struct Middle {
    inn: Inner;
}

contract DeepNest {
    mid: Middle;
    
    init() {
        self.mid = Middle{ inn: Inner{ val: 999 } };
    }
}
