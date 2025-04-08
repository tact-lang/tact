struct AA { a: Int }
struct BB { b: Int }

contract CrossStruct {
    x: AA;
    y: BB;
    z: AA;

    init() {
        self.x = AA{a:1};
        self.y = BB{b:2};
        self.z = AA{a:3};
    }
}