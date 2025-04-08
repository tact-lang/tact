struct DeepA { next: DeepB; }
struct DeepB { next: DeepC; }
struct DeepC { next: DeepD; }
struct DeepD { val: Int; }

contract DeepNested {
    data: DeepA;

    init() {
        self.data = DeepA{ next: DeepB{ next: DeepC{ next: DeepD{ val: 42 } } } };
    }
}
