struct DeepA {
    v: Int;
}
struct DeepB {
    a: DeepA;
}
struct DeepC {
    b: DeepB;
}
struct DeepD {
    c: DeepC;
}
struct DeepE {
    d: DeepD;
}
struct DeepF {
    e: DeepE;
}
struct DeepG {
    f: DeepF;
}
contract SevenLevels {
    d: DeepG = DeepG{f: DeepF{e: DeepE{d: DeepD{c: DeepC{b: DeepB{a: DeepA{v: 77}}}}}}};
}
