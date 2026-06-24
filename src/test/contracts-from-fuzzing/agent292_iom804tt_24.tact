struct MultiNest {
    a: Level1;
    b: Level2;
    c: Level3;
}

struct Level1 { val: Int }
struct Level2 { inner: Level1 }
struct Level3 { deep: Level2 }

contract CrossNest {
    m: MultiNest;

    init() {
        self.m = MultiNest{
            a: Level1{ val:1 },
            b: Level2{ inner:Level1{val:2} },
            c: Level3{ deep:Level2{inner:Level1{val:3}} }
        };
    }
}