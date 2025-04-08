struct RecursiveWrap {
    next: Inner?;
}

struct Inner {
    val: Int;
    more: Inner2?;
}

struct Inner2 {
    finished: Bool;
}

contract OptRecursive {
    s: RecursiveWrap;

    init() {
        self.s = RecursiveWrap{
            next: Inner{
                val: 5,
                more: Inner2{
                    finished: true
                }
            }
        };
    }
}
