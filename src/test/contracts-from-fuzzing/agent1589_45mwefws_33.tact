struct SubStruct { x: Int }

struct Outer {
    y: Int;
    sub: SubStruct?;
}

contract OptionalSubStruct {
    val: Outer;

    init() {
        self.val = Outer{ y: 7, sub:null };
    }
}