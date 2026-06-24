struct VeryDeepNested {
    a: Int;
}
struct Wrap1 { val: VeryDeepNested; }
struct Wrap2 { val: Wrap1; }
struct Wrap3 { val: Wrap2; }
struct Wrap4 { val: Wrap3; }
struct Wrap5 { val: Wrap4; }
struct Wrap6 { val: Wrap5; }

contract DeeplyWrapped {
    wrapper: Wrap6;
    init() {
        self.wrapper = Wrap6{val: Wrap5{val: Wrap4{val: Wrap3{val: Wrap2{val: Wrap1{val: VeryDeepNested{a:123}}}}}}};
    }
    receive() {}
}