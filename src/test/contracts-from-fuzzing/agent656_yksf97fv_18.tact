struct Level1 {
    child: Level2;
    val: Int;
}

struct Level2 {
    child: Level3;
    val2: String;
}

struct Level3 {
    finalVal: Int;
}

contract DeepChain(
    n: Level1,
    ready: Bool,
) {
}