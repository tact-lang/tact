struct Shallow { a: Int }
struct Middle { x: Int; s: Shallow }
struct Top { y: Bool; m: Middle; optStr: String? }

contract TestContract {
    val: Top;
    init() {
        self.val = Top{
            y: true,
            m: Middle{ x: 11, s: Shallow{ a: 22 } },
            optStr: null
        };
    }
}