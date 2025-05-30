// Very deep nesting for complex optional trees
struct Leaf { leafVal: Int }
struct Mid1 { m1: Leaf? }
struct Mid2 { m2: Mid1? }
struct Mid3 { m3: Mid2? }
struct Mid4 { m4: Mid3? }

contract CrazyDeep {
    fld: Mid4;

    init() {
        self.fld = Mid4{ m4:null };
    }
}