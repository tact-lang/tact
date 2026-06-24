struct Level5 {
    Value: Int;
}

struct Level4 {
    Inner: Level5;
    Extra: Int;
}

struct Level3 {
    Inner: Level4;
}

struct Level2 {
    Inner: Level3;
}

struct Level1 {
    Inner: Level2;
}

fun useDeepChain(l: Level1): Int {
    // Access Level4's Extra and Level5's Value
    return l.Inner.Inner.Inner.Extra + l.Inner.Inner.Inner.Inner.Value;
}

contract TestDeepChain {
    receive() {
        let l5 = Level5 { Value: 100 };
        let l4 = Level4 { Inner: l5, Extra: 50 };
        let l3 = Level3 { Inner: l4 };
        let l2 = Level2 { Inner: l3 };
        let l1 = Level1 { Inner: l2 };
        useDeepChain(l1);
    }
}
