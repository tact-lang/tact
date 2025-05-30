struct ComposeA {
    s: String?;
    val: Int?;
}

struct ComposeB {
    inner: ComposeA;
    flag: Bool?;
}

contract Combo {
    f: ComposeB = ComposeB{ inner: ComposeA{ s:null, val:42 }, flag:true };
}
