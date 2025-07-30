struct S { a: Int }
trait T {
    const VAL: Int = 5;
}

contract TraitStruct {
    data: S;
    init() {
        self.data = S{a:1};
    }
}