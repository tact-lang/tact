struct SubA { a: Int }
struct SubB { b: Int }
struct SubC { c: Int }

struct Composite {
    sa: SubA;
    sb: SubB;
    sc: SubC;
}

contract NestedStructs {
    cp: Composite;

    init() {
        self.cp = Composite{
            sa: SubA{a:1}, sb: SubB{b:2}, sc: SubC{c:3}
        };
    }
}