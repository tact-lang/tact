struct InnerMost { z: Int?; }
struct Middle { mid: InnerMost?; }
struct Outer { out: Middle?; }

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ out: Middle{ mid: null } };
    }
}