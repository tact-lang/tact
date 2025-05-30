struct Lvl3 {
    val3: Int;
}

struct Lvl2 {
    val2: Int;
    sub3: Lvl3;
}

struct Lvl1 {
    val1: Int;
    sub2: Lvl2;
}

contract TestContract {
    nested: Lvl1 = Lvl1{
        val1: 1,
        sub2: Lvl2{
            val2: 2,
            sub3: Lvl3{ val3: 3 }
        }
    };
}