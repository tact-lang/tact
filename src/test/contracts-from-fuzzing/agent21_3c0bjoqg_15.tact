struct DeepDefaultsOptional {
    nested: SubStruct? = null;
}

struct SubStruct {
    number: Int = 42;
    flag: Bool = true;
}

contract TestContract {
    ddopt: DeepDefaultsOptional;

    init() {
        self.ddopt = DeepDefaultsOptional{};
    }
}