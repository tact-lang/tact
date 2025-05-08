struct Base {
    num: Int;
}
struct Mid {
    base: Base?;
}
struct Top {
    mid: Mid;
}

contract OptionalDeepest {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                base: Base{ num: 314 }
            }
        };
    }

    receive() {
        if (self.data.mid.base != null) {
            let _ = self.data.mid.base!!.num;
        }
    }
}