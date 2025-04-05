struct Level5 {
    value: Int;
}

struct Level4 {
    child: Level5;
    value: Int;
}

struct Level3 {
    child: Level4;
    value: Int;
}

struct Level2 {
    child: Level3;
    value: Int;
}

struct Level1 {
    child: Level2;
    value: Int;
}

contract TestDeepChain {
    receive() {
         // Create a deep chain of 5 nested structs
         let d = Level1 {
             value: 1,
             child: Level2 {
                 value: 2,
                 child: Level3 {
                     value: 3,
                     child: Level4 {
                         value: 4,
                         child: Level5 { value: 5 }
                     }
                 }
             }
         };
         // Dump the value in the innermost struct
         dump(d.child.child.child.child.value);
    }
}
