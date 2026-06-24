struct Level5 {
    val: Int;
}

struct Level4 {
    level5: Level5;
    val: Int;
}

struct Level3 {
    level4: Level4;
    val: Int;
}

struct Level2 {
    level3: Level3;
    val: Int;
}

struct Level1 {
    level2: Level2;
    val: Int;
}

contract TestDeepChain {
    receive() {
         let obj: Level1 = Level1{
            val: 1,
            level2: Level2{
               val: 2,
               level3: Level3{
                  val: 3,
                  level4: Level4{
                     val: 4,
                     level5: Level5{
                         val: 5
                     }
                  }
               }
            }
         };
    }
}
