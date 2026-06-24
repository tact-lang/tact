struct DeepDeeper {
    deeper: Deepish;
}

struct Deepish {
    deep: Deeper;
}

struct Deeper {
    num: Int;
    flag: Bool;
}

contract NestedChain {
    s: DeepDeeper;

    init() {
        self.s = DeepDeeper{ deeper: Deepish{ deep: Deeper{ num:42, flag:false } } };
    }
}