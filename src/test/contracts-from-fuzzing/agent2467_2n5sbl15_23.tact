struct Inner { field: Int; }
struct Outer { nested: Inner; }

contract DefaultsVsInit {
    x: Outer;
    init() { self.x = Outer{ nested: Inner{ field: 17 } }; }
}