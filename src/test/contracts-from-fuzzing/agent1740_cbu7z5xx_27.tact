struct Deep {
    a: Int;
}

struct Mid {
    deep: Deep;
}

struct High {
    mid: Mid;
}

contract RecursiveAssign {
    val: High;

    init() {
        self.val = High {
            mid: Mid {
                deep: Deep {
                    a: 1234567890
                }
            }
        };
    }
}