struct Deepest {
    val: Int?;
}

struct Middle {
    deep: Deepest?;
}

struct Top {
    mid: Middle?;
    flag: Bool;
}

contract WeirdChain {
    persist: Top?;
    init() {
        self.persist = Top{
            mid: Middle{
                deep: null
            },
            flag: true
        };
    }
}