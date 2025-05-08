struct Stage1 {
    a: Int;
}

struct Stage2 {
    inner: Stage1;
}

struct Stage3 {
    deep: Stage2;
}

struct Stage4 {
    deeper: Stage3;
}

contract VeryDeepNested {
    level4: Stage4 = Stage4{
        deeper: Stage3{
            deep: Stage2{
                inner: Stage1{ a: 0 }
            }
        }
    };
}
