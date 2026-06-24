struct OptLayer3 { v: Int?; }

struct OptLayer2 { nxt: OptLayer3?; }

struct OptLayer1 { nxt: OptLayer2?; }

contract TestDeepOptionals {
    x: OptLayer1;

    init() {
        self.x = OptLayer1{ nxt: null };
    }
}