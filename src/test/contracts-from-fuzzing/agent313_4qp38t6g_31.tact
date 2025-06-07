struct CrossTypeCompose {
    a: Int;
    s: String;
    b: Bool;
}

struct ContainerCross {
    c1: CrossTypeCompose;
    c2: CrossTypeCompose;
}

contract CrossNestedTypesTest {
    val: ContainerCross;

    init() {
        self.val = ContainerCross{
            c1: CrossTypeCompose{a:1,s:"x",b:true},
            c2: CrossTypeCompose{a:2,s:"y",b:false}
        };
    }
}