struct DeepA {
    x: Int;
}

struct DeepB {
    child: DeepA;
}

struct DeepC {
    child: DeepB;
}

struct DeepD {
    child: DeepC;
}

struct DeepE {
    child: DeepD;
}

contract FiveDeepNestedContract {
    data: DeepE = DeepE{child: DeepD{child: DeepC{child: DeepB{child: DeepA{x:0}}}}};
}