struct Top {
    a: Int;
    b: Mid;
}

struct Mid {
    c: Int;
    d: Bottom;
}

struct Bottom {
    e: Int;
}

contract TestContract {
    val: Top = Top{
        a:1,
        b: Mid{
            c:2,
            d: Bottom{
                e:3
            }
        }
    };
}