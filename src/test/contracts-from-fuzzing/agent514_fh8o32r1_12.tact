struct AA { a: Int; }
struct BB { b: AA; }
struct CC { c: BB; }
struct DD { d: CC; }

contract DeepChain {
    val: DD;
    init() {
        self.val = DD{ d: CC{ c: BB{ b: AA{ a: 1 } } } };
    }
}