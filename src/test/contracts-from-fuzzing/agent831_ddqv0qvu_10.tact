struct Level5 {
    val5: Int;
}
struct Level4 {
    val4: Int;
    s5: Level5;
}
struct Level3 {
    val3: Int;
    s4: Level4;
}
struct Level2 {
    val2: Int;
    s3: Level3;
}
struct Level1 {
    val1: Int;
    s2: Level2;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            val1:1,
            s2: Level2{
                val2:2, s3: Level3{
                    val3:3, s4: Level4{
                        val4:4, s5: Level5{
                            val5:5
                        }
                    }
                }
            }
        };
    }
}