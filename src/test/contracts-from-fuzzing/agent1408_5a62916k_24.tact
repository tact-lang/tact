struct ComposeOptions {
    a: Int?;
    b: Int;
}

contract TestContract {
    s1: ComposeOptions;
    s2: ComposeOptions;

    init() {
        self.s1 = ComposeOptions{a:null,b:5};
        self.s2 = ComposeOptions{a:42,b:10};
    }
}