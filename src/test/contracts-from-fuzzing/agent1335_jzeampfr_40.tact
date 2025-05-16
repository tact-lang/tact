struct AA { x: Int; }
struct BB { x: Int; }

contract StructSameFieldNames {
    a: AA;
    b: BB;

    init() {
        self.a = AA{ x: 1 };
        self.b = BB{ x: 2 };
    }
}