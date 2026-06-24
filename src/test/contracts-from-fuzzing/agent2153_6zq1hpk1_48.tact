struct TypeA {
    aa: Int?;
}

struct TypeB {
    bb: TypeA?;
}

struct TypeC {
    cc: TypeB?;
}

contract ChainOptStructs {
    head: TypeC;

    init() {
        self.head = TypeC{ cc: null };
    }
}
