struct AA { a: Int; }
struct BB { b: Bool; }
struct CC { c: String; }

contract ManyTypes {
    x: AA;
    y: BB;
    z: CC;

    init() {
        self.x = AA{ a: 0 };
        self.y = BB{ b: true };
        self.z = CC{ c: "hi" };
    }
}