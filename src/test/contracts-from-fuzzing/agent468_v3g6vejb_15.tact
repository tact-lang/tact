struct Levels {
    a: Int;
    b: L1;
    c: L2;
}

struct L1 { val: Int; }
struct L2 { val: Inner; }
struct Inner { deep: Int; }

contract TestContract {
    lv: Levels;

    init() {
        self.lv = Levels{
            a:1,
            b:L1{ val:2 },
            c:L2{ val:Inner{ deep:3 } }
        };
    }
}