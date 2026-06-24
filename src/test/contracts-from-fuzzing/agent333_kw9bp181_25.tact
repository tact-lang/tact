struct DeepNestA { v: Int; }
struct DeepNestB { next: DeepNestA; }
struct DeepNestC { next: DeepNestB; }
struct DeepNestD { next: DeepNestC; }
struct DeepNestE { next: DeepNestD; }
struct DeepNestF { next: DeepNestE; }
struct DeepNestG { next: DeepNestF; }

contract TestContract {
    root: DeepNestG;

    init() {
        self.root = DeepNestG{ next: DeepNestF{ next: DeepNestE{ next: DeepNestD{ next: DeepNestC{ next: DeepNestB{ next: DeepNestA{ v: 10 } } } } } } };
    }
}