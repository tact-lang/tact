struct RecA { x: RecB?; val: Int }
struct RecB { y: RecC?; val: Int }
struct RecC { val: Int }

contract TestContract {
    rec: RecA;

    init() {
        self.rec = RecA{ x: RecB{ y: RecC{ val: 3 }, val: 2 }, val: 1 };
    }
}