// Large persistent struct nested one level
struct LargeNested {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    a6: Int; a7: Int; a8: Int; a9: Int; a10: Int;
}

struct Holder {
    nested: LargeNested;
    extra: Int;
}

contract TestContract {
    data: Holder;

    init() {
        self.data = Holder{
            nested: LargeNested{ a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10 },
            extra: 99
        };
    }
}