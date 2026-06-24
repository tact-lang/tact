// deeply nested options with inner
struct Innermost { z: Int?; }
struct Mid { mid: Innermost?; }
struct Outer { midOuter: Mid?; }

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ midOuter: null };
    }
}