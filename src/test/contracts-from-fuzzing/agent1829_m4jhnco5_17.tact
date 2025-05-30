struct Deepest { val: Int?; }
struct Middle { deep: Deepest?; }
struct Top { mid: Middle; }

contract TestContract {
    data: Top;

    init() {
        self.data = Top{ mid: Middle{ deep: null } };
    }
}