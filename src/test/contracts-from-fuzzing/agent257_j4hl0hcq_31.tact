struct Level2 {
    s: String;
}

struct Level1 {
    l2: Level2;
}

contract NestedString {
    inner: Level1 = Level1{l2: Level2{s: "txt"}};
}