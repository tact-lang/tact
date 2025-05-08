contract SingleOptionalStruct {
    data: OptStruct;

    init() {
        self.data = OptStruct{};
    }
}

struct OptStruct {
    foo: Int?; // optional primitive
    bar: Bool?; 
    baz: Address?;
    s: SubStruct?;
}

struct SubStruct {
    x: Int;
}