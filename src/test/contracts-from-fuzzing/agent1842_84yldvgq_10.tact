struct Deep1 {
    v1: Int;
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
struct Deep5 {
    d4: Deep4;
}

contract VeryDeepNested {
    final: Deep5;

    init() {
        self.final = Deep5{ d4: Deep4{ d3: Deep3{ d2: Deep2{ d1: Deep1{ v1: 999 }}}}};
    }
}