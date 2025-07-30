struct S_A { f1: Int; }
struct S_B { f2: Int; nested: S_A; }
struct S_C { f3: Int; nestedB: S_B; }

contract EmbedChain {
    deep: S_C;

    init() {
        self.deep = S_C{ f3: 3, nestedB: S_B{ f2: 2, nested: S_A{ f1: 1 } } };
    }
}