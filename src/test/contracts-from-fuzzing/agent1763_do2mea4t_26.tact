struct DeeplyNested {
    a: Int;
    b: String?;
}
struct Wrap1 {
    v: DeeplyNested;
}
struct Wrap2 {
    v: Wrap1;
}
contract VeryDeepNested {
    val: Wrap2;

    init() {
        self.val = Wrap2{ v: Wrap1{ v: DeeplyNested{ a:1, b:null } } };
    }
}