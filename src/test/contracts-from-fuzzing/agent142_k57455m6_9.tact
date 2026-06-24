struct Level2 {
    number: Int?;
}

struct Level1 {
    lvl2: Level2?;
}

contract TestContract {
    chain: Level1? = null;

    init() {}

    receive() {}
}