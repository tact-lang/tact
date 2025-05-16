struct Alt1 { x: Int }
struct Alt2 { y: Bool }
struct Alt3 { z: Int? }

contract MultiFields {
    f1: Alt1;
    f2: Alt2;
    f3: Alt3;

    init() {
        self.f1 = Alt1{ x: -1 };
        self.f2 = Alt2{ y: false };
        self.f3 = Alt3{ z: null };
    }
}