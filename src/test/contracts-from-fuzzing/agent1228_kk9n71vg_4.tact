struct Sub {
    text: String?; // optional defaults to null
}

struct Container {
    id: Int = 11; // has default
    extra: Sub;  // no default
}

contract ContractWithDefaults {
    cont: Container;

    init() {
        self.cont = Container{
            extra: Sub{
                text: null
            }
        };
    }
}