struct Deep1 {
    v: Int;
}
struct Deep2 {
    d1: Deep1;
}
struct Deep3 {
    d2: Deep2;
}
struct Deep4 {
    d3: Deep3;
}
contract TestContract {
    deepField: Deep4;
    init() {
        self.deepField = Deep4{ d3: Deep3{ d2: Deep2{ d1: Deep1{ v: 42 }}}};
    }
}