struct DeepA { next: DeepB; }
struct DeepB { next: DeepC; }
struct DeepC { next: DeepD; }
struct DeepD { next: DeepE; }
struct DeepE { value: Int; }

contract DeepStruct {
    val: DeepA;

    init() {
        self.val = DeepA{ next: DeepB{ next: DeepC{ next: DeepD{ next: DeepE{ value:42 } } } } };
    }
}
