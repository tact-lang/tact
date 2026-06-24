struct NestLevel2 {
    deep: Int = 7;
}

struct NestLevel1 {
    nested: NestLevel2;
}

contract TestContract {
    inner: NestLevel1;

    init() {
        self.inner = NestLevel1{ nested: NestLevel2{} };
    }
}