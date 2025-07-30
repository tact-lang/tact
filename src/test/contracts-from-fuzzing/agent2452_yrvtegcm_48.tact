struct StructOne { a: Int; }
struct StructTwo { b: Int; s: StructOne; }
contract NestedTwice {
    s2: StructTwo;
    init() {
        self.s2 = StructTwo{b:1,s:StructOne{a:2}};
    }
}