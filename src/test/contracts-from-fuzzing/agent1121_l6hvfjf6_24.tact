struct DeepTreeA {
    val: Int;
}

struct DeepTreeB {
    child: DeepTreeA;
}

struct DeepTreeC {
    child: DeepTreeB;
}

struct DeepTreeD {
    child: DeepTreeC;
}

struct DeepTreeE {
    child: DeepTreeD;
}

contract DeepStructTree {
    root: DeepTreeE;

    init() {
        self.root = DeepTreeE{child:DeepTreeD{child:DeepTreeC{child:DeepTreeB{child:DeepTreeA{val:7}}}}};
    }
}