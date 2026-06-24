struct NestedA { aa: Int; ab: Bool; }
struct NestedB { ba: Int; bb: Bool; }
struct NestedC { ca: Int; cb: Bool; }

struct Container {
    a: NestedA;
    b: NestedB;
    c: NestedC;
    flag: Bool;
    label: String;
}

contract TestContract {
    persist: Container;
    init() {
        self.persist = Container{
            a: NestedA{ aa:1, ab:true },
            b: NestedB{ ba:2, bb:false },
            c: NestedC{ ca:3, cb:true },
            flag: false,
            label: "done"
        };
    }
}