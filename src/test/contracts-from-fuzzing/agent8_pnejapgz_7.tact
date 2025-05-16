struct Level4 { a: Int; }

struct Level3 { l4: Level4; }

struct Level2 { l3: Level3; }

struct Level1 { l2: Level2; }

contract NestedStructContract {
    receive() {
        let l4: Level4 = Level4 { a: 123 };
        let l3: Level3 = Level3 { l4: l4 };
        let l2: Level2 = Level2 { l3: l3 };
        let data: Level1 = Level1 { l2: l2 };
        let nestedValue: Int = data.l2.l3.l4.a;
    }
}
