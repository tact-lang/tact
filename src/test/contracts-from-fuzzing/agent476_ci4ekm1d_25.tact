struct N1 { x: Int }
struct N2 { x: N1 }
struct N3 { x: N2 }
struct N4 { x: N3 }
struct N5 { x: N4 }
struct N6 { x: N5 }

contract SixDeep {
    val: N6;
    init() {
        self.val = N6{ x: N5{ x: N4{ x: N3{ x: N2{ x: N1{ x: 99 } } } } } };
    }
    receive() {
        let _ = self.val.x.x.x.x.x.x;
    }
}