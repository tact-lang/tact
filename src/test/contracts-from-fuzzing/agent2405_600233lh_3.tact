struct Deep1 {
    p: Int;
}

struct Deep2 {
    child: Deep1;
}

struct Deep3 {
    child: Deep2;
}

struct Deep4 {
    child: Deep3;
}

contract DeepContract {
    nested: Deep4;

    init() {
        self.nested = Deep4{ child: Deep3{ child: Deep2{ child: Deep1{ p: 42 } } } };
    }
}