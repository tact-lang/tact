struct OptChain1 {
    a: OptChain2?;
}

struct OptChain2 {
    b: OptChain3?;
}

struct OptChain3 {
    c: Int?;
}

contract OptionalDepths {
    s: OptChain1;

    init() {
        self.s = OptChain1{ a: OptChain2{ b: OptChain3{ c:null } } };
    }
}