struct ContainsBuilderOpt {
    b: Builder?;
}

contract ContainerOpt {
    field: ContainsBuilderOpt;

    init() {
        self.field = ContainsBuilderOpt{ b: null };
    }
}