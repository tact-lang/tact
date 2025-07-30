message(2) MInner {
    id: Int = 7;
}

struct Outer {
    title: String = "abc";
    m: MInner;
}

contract StructMsgMix {
    data: Outer = Outer{ m: MInner{} };
}