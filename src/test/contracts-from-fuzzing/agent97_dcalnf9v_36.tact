struct BaseStruct { value: Int }

struct ContainerOptional {
    data: BaseStruct?;
}

contract OptContainingStruct {
    cont: ContainerOptional;
    init() {
        self.cont = ContainerOptional{ data: null };
    }
}