struct Deep {
    val: Int = 42;
}
struct Mid {
    deep: Deep;
}
struct Top {
    mid: Mid;
}

contract Test {
    top: Top = Top{
        mid: Mid{
            deep: Deep{}
        }
    };
}
