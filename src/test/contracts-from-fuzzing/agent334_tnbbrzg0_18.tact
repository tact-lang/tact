struct NestedStringOpt {
    s: String?;
}
struct ContainerOpt {
    field: NestedStringOpt?;
}
contract Test {
    f: ContainerOpt;

    init() {
        self.f = ContainerOpt{ field: NestedStringOpt{ s: null } };
    }
}