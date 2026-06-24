message(0x1234) FooMsg {
    k: Int?;
}

struct BarStruct {
    n: Int?;
}

contract MixParams(
    prmA: FooMsg?,
    prmB: BarStruct?,
    prmC: Int?,
    prmD: Bool?,
    prmE: String?,
) {}