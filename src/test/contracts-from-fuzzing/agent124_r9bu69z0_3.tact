struct NestLevel3 {
    a: Int;
}

struct NestLevel2 {
    inner: NestLevel3;
}

struct NestLevel1 {
    inner: NestLevel2;
}

contract DeepNested {
    val: NestLevel1;
    init() {
        self.val = NestLevel1{ inner: NestLevel2{ inner: NestLevel3{ a: 42 } } };
    }
}