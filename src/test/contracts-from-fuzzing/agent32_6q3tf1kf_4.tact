struct Level5 {
    value: Int;
}

struct Level4 {
    next: Level5;
    value: Int;
}

struct Level3 {
    next: Level4;
    value: Int;
}

struct Level2 {
    next: Level3;
    value: Int;
}

struct Level1 {
    next: Level2;
    value: Int;
}

contract TestDeepNested {
    receive() {
         let l: Level1 = Level1{
             value: 1,
             next: Level2{
                 value: 2,
                 next: Level3{
                     value: 3,
                     next: Level4{
                         value: 4,
                         next: Level5{ value: 5 }
                     }
                 }
             }
         };
         let sum: Int = l.value + l.next.value + l.next.next.value + l.next.next.next.value + l.next.next.next.next.value;
         sum;
    }
}
