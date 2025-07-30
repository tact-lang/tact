struct Level5 { v: Int; }
struct Level4 { l5: Level5; }
struct Level3 { l4: Level4; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract TestDeepChain {
    receive() {
         let lv5: Level5 = Level5{ v: 555 };
         let lv4: Level4 = Level4{ l5: lv5 };
         let lv3: Level3 = Level3{ l4: lv4 };
         let lv2: Level2 = Level2{ l3: lv3 };
         let lv1: Level1 = Level1{ l2: lv2 };
         dump(lv1.l2.l3.l4.l5.v);
    }
}
