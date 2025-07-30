struct AA {
    val: Int?;
}

struct BB {
    sub: AA?;
}

struct CC {
    sub: BB?;
}

struct DD {
    sub: CC?;
}

contract TestContract {
    big: DD;
    init() {
        self.big = DD{
            sub: CC{
                sub: BB{
                    sub: AA{ val: null }
                }
            }
        };
    }
}