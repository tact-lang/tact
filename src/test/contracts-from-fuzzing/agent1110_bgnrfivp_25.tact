struct NestedStrOpt {
    s1: String?;
    s2: String?;
}

struct ContainerOpt {
    nest: NestedStrOpt?;
}

contract ComplexOpts {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{
            nest: NestedStrOpt{ s1:null, s2:"hello" }
        };
    }
}