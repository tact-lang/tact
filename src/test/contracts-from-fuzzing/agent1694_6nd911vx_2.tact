struct Inner { val: Int?; }
struct Outer { nested: Inner; optNested: Inner?; }

contract Test {
    data: Outer = Outer{ nested: Inner{val: null}, optNested: null };
}