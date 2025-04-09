struct ChainLevel3 {
    flag: Bool?
}

struct ChainLevel2 {
    next: ChainLevel3?
}

struct ChainLevel1 {
    next: ChainLevel2?
}

contract ChainOptionalsTest {
    value: ChainLevel1;

    init() {
        self.value = ChainLevel1{
            next: ChainLevel2{
                next: ChainLevel3{
                    flag: null,
                },
            },
        };
    }

    receive() {
        let _ = self.value;
    }
}
